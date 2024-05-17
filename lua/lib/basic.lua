-- basic.lua

local basic = {}
package.loaded[...] = basic
basic.encoder = {}

function basic.index(table, item)
  for k, v in pairs(table) do
    if v == item then return k end
  end
end

function basic.map(table, func)
  local t = {}
  for k, v in pairs(table) do
    t[k] = func(v)
  end
  return t
end

function basic.matchstr(str, pat)
  local t = {}
  for i in str:gmatch(pat) do
    t[#t + 1] = i
  end
  return t
end

function basic.utf8chars(str, ...)
  local chars = {}
  for pos, code in utf8.codes(str) do
    chars[#chars + 1] = utf8.char(code)
  end
  return chars
end

function basic.utf8sub(str, first, ...)
  local last = ...
  if last == nil or last > utf8.len(str) then
    last = utf8.len(str)
  elseif last < 0 then
    last = utf8.len(str) + 1 + last
  end
  local fstoff = utf8.offset(str, first)
  local lstoff = utf8.offset(str, last + 1)
  if fstoff == nil then fstoff = 1 end
  if lstoff ~= nil then lstoff = lstoff - 1 end
  return string.sub(str, fstoff, lstoff)
end

function basic.encoder.parse_formula(formula)
  if type(formula) ~= 'string' or formula:gsub('%u%l', '') ~= '' then
    return
  end
  local rule = {}
  local A, a, U, u, Z, z = ('AaUuZz'):byte(1, -1)
  for m in formula:gmatch('%u%l') do
    local upper, lower = m:byte(1, 2)
    local char_idx = upper < U and upper - A + 1 or upper - Z - 1
    local code_idx = lower < u and lower - a + 1 or lower - z - 1
    rule[#rule + 1] = {char_idx, code_idx}
  end
  return rule
end

function basic.encoder.load_settings(setting)
  -- 注意到公式同则规则同，可通过 f2r 在 rt 中作引用定义，以节省资源。
  local ft, f2r, rt = {}, {}, {}
  for _, t in ipairs(setting) do
    if t.length_equal then
      ft[t.length_equal] = t.formula
    elseif t.length_in_range then
      local min, max = table.unpack(t.length_in_range)
      for l = min, max do ft[l] = t.formula end
    end
  end
  -- setting 中的 length 不一定连续且一般不包括 1，所以不能用 ipairs()。
  for k, f in pairs(ft) do
    local rule = basic.encoder.parse_formula(f)
    if not rule then return end
    if not f2r[f] then f2r[f] = rule end
    rt[k] = f2r[f]
  end
  return rt
end

function basic.switch_option(name, context)
  context:set_option(name, not context:get_option(name))
end

function basic.cycle_options(options, env, reverse)
  local context = env.engine.context
  if #options == 0 then return 0 end
  if #options == 1 then
    basic.switch_option(options[1], context)
    return 1
  end
  local state
  for k, v in ipairs(options) do
    if context:get_option(v) then
      context:set_option(v, false)
      state = (reverse and (k - 1) or (k + 1)) % #options
      if state == 0 then state = #options end
      break
    end
  end
  local k = state or options.save or options.default or 1
  context:set_option(options[k], true)
  return k
end

-- Set an option in 'options' if no one is set yet.
function basic.init_options(options, context)
  for k, v in ipairs(options) do if context:get_option(v) then return end end
  local k = state or options.save or options.default or 1
  context:set_option(options[k], true)
end

-- Generate a processor that cycle a group of options with a key.
-- For now only works when composing.
function basic.make_option_cycler(options, cycle_key_config_path,
                                 switch_key_config_path, reverse)
  local processor, cycle_key, switch_key = {}
  processor.init = function(env)
    local config = env.engine.schema.config
    basic.init_options(options, env.engine.context)
    cycle_key = config:get_string(cycle_key_config_path)
    switch_key = config:get_string(switch_key_config_path)
  end
  processor.func = function(key, env)
    local context = env.engine.context
    if context:is_composing() and key:repr() == cycle_key then
      local state = basic.cycle_options(options, env, reverse)
      if state > 1 then options.save = state end
      return 1
    elseif context:is_composing() and key:repr() == switch_key then
      -- 选项状态可能在切换方案时被重置，因此需检测更新。但是不能在 filter.init
      -- 中检测，因为得到的似乎是重置之前的状态，说明组件初始化先于状态重置。为
      -- 经济计，仅在手动切换开关时检测。
      -- https://github.com/rime/librime/issues/449
      -- Todo: 对于较新的 librime-lua，尝试利用 option_update_notifier 更新
      -- options.save
      for k, v in ipairs(options) do
        if context:get_option(v) then
          if k > 1 then options.save = k end
        end
      end
      local k = options.save or options.default
      -- Consider the 1st options as OFF state.
      if context:get_option(options[1]) then
        context:set_option(options[1], false)
        context:set_option(options[k], true)
      else
        context:set_option(options[k], false)
        context:set_option(options[1], true)
      end
      return 1
    end
    return 2 -- kNoop
  end
  return processor
end