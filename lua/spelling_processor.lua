local basic = require('lib/basic')
-- options 要与方案保持一致
local options = { 'spelling.off', 'spelling.lv1', 'spelling.lv2', 'spelling.lv3' }
options.default = 4

local processor = basic.make_option_cycler(options,
    'spelling/lua/cycle_key',
    'spelling/lua/switch_key')

return processor
