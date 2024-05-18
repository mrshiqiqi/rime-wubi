![](images/楔子.png)

## 写给热爱打字的你

> 我们曾是诗的国度，你我的魂早已浸透了仓颉的恩泽。   
> 相信你也曾像太白一样诗意盎然，忽复乘舟梦日边。   
> 也曾执管挥毫，畅想兰亭轶闻，放浪形骸于山水之间。   
> 你有你的故事，我有我的酒。   
> 用最初的文字，记录每一处痕迹，直到盛满整个星汉。   
> 当你用它打字时，你就成了最浪漫的诗人！  

## 打字表现

### Windows 端表现

![](images/windows展示.png)

### MacOS 端表现

![](images/mac%E5%B1%95%E7%A4%BA.png)

## 配置说明

### 初次安装

1. 下载官方 [Rime 小狼毫版本安装包](https://rime.im/download/)，并安装到目标机器
2. 下载本方案，将所有文件覆盖到 **Rime** 的用户目录下（最好是先删除原有配置，再全部复制进去）
3. 打开 **font** 文件夹，安装其中的 **黑体字根.ttf** 字体
4. 重新部署 **Rime**，就可以打字了（默认是 86 版五笔方案）

### 切换五笔版本

在本方案的根目录，找到 `tables` 文件夹，该文件夹下的子文件夹 `86/98/06` 分别内置了不同版本的码表，以新世纪版本为例，打开 `tables/06` 文件夹后，将里面所有的内容覆盖到 Rime 用户目录下，重新部署，即可切换为新世纪五笔。

## 基本功能

### 快捷键

|快捷键|功能|
| ---- | ---- |
|ctrl + `|菜单项|
|ctrl + shift + h|拆分显示与隐藏|
|ctrl + shift + j|编码提示与隐藏|
|ctrl + shift + f|繁简转换|
|ctrl + shift + u|生僻字显示与隐藏|
|shift|中英文切换|
|shift + space|全角半角切换|
|ctrl + .|中英文标点切换|

### 功能键

|功能键|功能|
| ----- | ---- |
|help|帮助菜单|
|mode|模式切换菜单|
|date|显示当前日期|
|time|显示当前时间|
|week|显示当前星期|
|nl|显示当前农历|
|jq|显示当前二十四节气|
|z|反查，重复上次上屏内容|
|`|临时自造词|
|~|以形查音|
|=|激活计算器功能和大小写金额转换功能|
|==|激活农历反查功能|

### 系统日期显示

以下功能默认处于开启状态。

|编码|说明|
| ----- | ---- |
|date|输出当天日期|
|time|输出当前时间|
|week|输出当前星期|

除了以上三个编码可以输出系统时间外，另添加以下关键词，用以输出对应的日期与日间。  
这些关键词包括：【今天、昨天、前天、明天、后天、时间、本周、上周、下周、本月、上月和下月】。  
其中【上月】和【下月】输出的结果如果月末天数不同时按最小月末数计算。

## 常用自定义配置

*以下配置说明按 `wubi_ci.shema.yaml` 方案作为参考，其同样适用于 `wubi_dz.shema.yaml` 等其他方案的配置。*  
**以下所有的配置，都推荐在 `方案.custom.yaml` 中以补丁的方式配置（如果没有对应的 `.custom.yaml` 文件，请自行创建），以避免在更新项目的时候导致个人配置信息丢失！**  
*`方案.custom.yaml` 中的补丁写法，请参照 [定制指南（初阶）](https://github.com/rime/home/wiki/CustomizationGuide)。*  


**注意：在 `custom` 文件首行一定要添加一行注释，避免 `Rime` 解析出错。**

### 自定义候选项个数

默认的候选个数是 `5` 个。文件位置 `wubi_ci.custom.yaml`。

```yaml
# wubi_ci shema setting

patch:
  "menu/page_size": 9
```

### 自定义候选序号样式

默认的序号格式是带圆圈的中文数字符号。文件位置 `wubi_ci.custom.yaml`。

```yaml
# wubi_ci shema setting

patch:
  "menu/alternative_select_labels": [ 〡, 〢, 〣, 〤, 〥, 〦, 〧, 〨, 〩, 〸, 〹, 〺 ]
```

### 四码唯一自动上屏

文件位置 `wubi_ci.custom.yaml`

```yaml
# wubi_ci shema setting

patch:
  "speller/auto_select": true
```

### 回车清空编码

默认情况下，回车会将编码上屏。如果需要设置为回车清空编码，可以按下方法进行修改。

文件位置 `wubi_ci.custom.yaml`

```yaml
# wubi_ci shema setting

patch:
  key_binder/bindings/+:
    - {accept: Return, send: Escape, when: composing}
    - {accept: Return, send: Escape, when: has_menu}
```

### 空码时自动清除编码

文件位置 `wubi_ci.custom.yaml`，本例中，节点有引号和无引号的写法都是可以被正确解析的。

```yaml
# wubi_ci shema setting

patch:
  speller/max_code_length: 4   
  "speller/auto_clear": max_length
```

### 开启自动调频

自动调频功能默认是关闭状态，如需要开启自动调频功能，可参考以下方法。

文件位置 `wubi_ci.custom.yaml`

```yaml
# wubi_ci shema setting

patch:
  translator/enable_user_dict: true
```

### 开启自动造词

自动造词需要满足以下条件：
1. 禁用四码唯一自动上屏功能；
2. 句子输入模式开启；
3. 开启用户词典功能；

文件位置 `wubi_ci.custom.yaml`，此时，将同时开启自动调频、自动造词功能。

```yaml
# wubi_ci shema setting

patch:
  speller/max_code_length: 0   # 最长编码长度，0表示不设置长度
  speller/auto_select: false  # 关闭自动上屏
  translator/enable_sentence: true  # 开启句子输入模式（连打模式）
  translator/enable_user_dict: true  # 启用用户词典
  translator/enable_encoder: true  # 启用编码器
```

### 顶字上屏功能

顶字上屏功能简称「顶功」，这种模式需要固定最长编码为 `4`，并且禁用**四码唯一时自动上屏功能**，配置如下。

文件位置 `wubi_ci.custom.yaml`。

```yaml
# wubi_ci shema setting

patch:
  speller/max_code_length: 4   # 最长编码长度，0表示不设置长度
  speller/auto_select: false  # 关闭自动上屏
```

### 外观文字横向排列

以 windows 端为例，默认外观的文字是竖向排列的，如果想将其修改为横向排列，可以 `weasel.custom.yaml` 中进行修改，这个文件一般是在部署时自动生成的，如果没有该文件，请手动创建一个。

```yaml
# weasel.custom setting

patch:
  "style/vertical_text": false  # 是否启用文本纵向显示
```

### More

更多配置详情，可前往 [Wiki 页](https://gitee.com/hi-coder/rime-wubi/wikis/Home) 进行了解。

## 中书君

中书君是针对本方案的一个管理器，旨在帮助广大用户简化 Rime 方案的配置难度。（目前中书君项目还处于 alpha 的内研阶段，beta 正式版还未正式上线。）以下是图示：

![](images/%E4%B8%AD%E4%B9%A6%E5%90%9B.png)

项目体验地址：
- Gitee 地址：https://gitee.com/hi-coder/WubiMaster
- Github 地址：https://github.com/mrshiqiqi/WubiMaster

## 捐赠 🌻

> 感谢您选择并使用这款开源软件！您的信任与支持是我持续前进的动力。  
> 开源软件的研发与维护离不开开发者的辛勤付出与无私奉献。为了保持软件的持续更新与优化，恳请您在能力范围内考虑对本项目进行捐赠。  
> 您的每一份捐赠，都将直接用于软件的开发、测试、维护以及优化，帮助更多用户享受到更好的使用体验。  
> 您可以选择通过支付宝、微信等在线支付平台进行捐赠，捐赠金额不限，您的每一份心意我都将倍加珍惜。  
>  再次感谢您的支持与厚爱！祝您生活愉快，工作顺利！  
> 空山明月 敬上

![](images/%E6%8D%90%E8%B5%A0.jpg)

### 捐赠记录

|日期|捐赠者|金额|留言|
| ----- | ----- | ----- | ----- |
|2024-5-6|**飞|30.00|请保持维护和更新，我一直在用新世纪的码表|
|2024-5-7|天青色|10.00|空山佬的方案让我再次爱上了五笔|
|2024-5-8|An|5.00|无|
|2024-5-8|*|50.00|无|
|2024-05-15|YG777|66.00|无|
|2024-05-16|悟空|30.00|无|
|2024-05-18|WIIMOO|120.00|怎能辜负了这群为爱发电的战士，记得我的五笔拼音长语句输入哦|

## QQ群

欢迎加入！

![](images/QQ.jpg)

## 有问有答

*问：我部署了 `98` 版码表文件，但想用 `86` 的外观主题，请问怎么配置？*

> 答：在 `tables` 目录的子文件下，含有不同版本的码表文件及一个外观主题文件 `weasel.yaml`，可以将 `tables/86/weasel.yaml` 替换到用户目录下，重新部署，即可使用 `诗意之春` 主题。

*问：更换外观主题后重新部署，但主题还是 `86` 方案默认的绿色主题，这个问题怎么解决？*

> 答：本项目默认不提供任何 `.custom.yaml` 配置文件，因此，在部署完成后，用户目录下会生成一个空的 `weasel.custom.yaml` 文件。解决方法有两种，一种是在这个文件首行添加一行注释，即以 `#` 开头的文字描述，另一种是将这个文件删除。之后再重新部署，新更新的主题即可显现。

## Git Commit emoji Guide  提交表情使用指北

在执行 `git commit` 指令时使用 `emoji` 图标为本次提交添加一个特别的图标， 这个本次提交的记录很容易突出重点，或者说光看图标就知道本次提交的目的。这样就方便在日后查看历史提交日子记录中快速的查找到对于的提交版本。由于有很多不同的表情符号，表情库更新后，没有一个可以帮助更轻松地使用表情符号的中文表情库列表。所以这里主要列出 [gitmoji](https://github.com/carloscuesta/gitmoji) 项目中规定的 `emoji` 规范的表情符号列表。

#### `gitmoji` 表情库

| emoji 表情        | emoji 代码                    | commit 说明                  |
| ----------------- | ----------------------------- | ---------------------------- |
| 🎨 (调色板)        | `:art:`                       | 改进代码结构/代码格式        |
| ⚡ (闪电) 🐎 (赛马) | `:zap:` `:racehorse:`         | 提升性能                     |
| 🔥 (火焰)          | `:fire:`                      | 移除代码或文件               |
| 🐛 (bug)           | `:bug:`                       | 修复 bug                     |
| 🚑 (急救车)        | `:ambulance:`                 | 重要补丁                     |
| ✨ (火花)          | `:sparkles:`                  | 引入新功能                   |
| 📝 (备忘录)        | `:memo:`                      | 撰写文档                     |
| 🚀 (火箭)          | `:rocket:`                    | 部署功能                     |
| 💄 (口红)          | `:lipstick:`                  | 更新 UI 和样式文件           |
| 🎉 (庆祝)          | `:tada:`                      | 初次提交                     |
| ✅ (白色复选框)    | `:white_check_mark:`          | 增加测试                     |
| 🔒 (锁)            | `:lock:`                      | 修复安全问题                 |
| 🍎 (苹果)          | `:apple:`                     | 修复 macOS 下的内容          |
| 🐧 (企鹅)          | `:penguin:`                   | 修复 Linux 下的内容          |
| 🏁 (旗帜)          | `:checked_flag:`              | 修复 Windows 下的内容        |
| 🤖 (Android机器人) | `:robot:`                     | 修复Android上的某些内容。    |
| 🍏 (绿苹果)        | `:green_apple:`               | 解决iOS上的某些问题。        |
| 🔖 (书签)          | `:bookmark:`                  | 发行/版本标签                |
| 🚨 (警车灯)        | `:rotating_light:`            | 移除 linter 警告             |
| 🚧 (施工)          | `:construction:`              | 工作进行中                   |
| 💚 (绿心)          | `:green_heart:`               | 修复 CI 构建问题             |
| ⬇️ (下降箭头)      | `:arrow_down:`                | 降级依赖                     |
| ⬆️ (上升箭头)      | `:arrow_up:`                  | 升级依赖                     |
| 📌 (图钉)          | `:pushpin:`                   | 将依赖关系固定到特定版本。   |
| 👷 (工人)          | `:construction_worker:`       | 添加 CI 构建系统             |
| 📈 (上升趋势图)    | `:chart_with_upwards_trend:`  | 添加分析或跟踪代码           |
| ♻️ (循环箭头)      | `:recycle:`                   | 重构代码。                   |
| 🔨 (锤子)          | `:hammer:`                    | 重大重构                     |
| ➖ (减号)          | `:heavy_minus_sign:`          | 减少一个依赖                 |
| 🐳 (鲸鱼)          | `:whale:`                     | Docker 相关工作              |
| ➕ (加号)          | `:heavy_plus_sign:`           | 增加一个依赖                 |
| 🔧 (扳手)          | `:wrench:`                    | 修改配置文件                 |
| 🌐 (地球)          | `:globe_with_meridians:`      | 国际化与本地化               |
| ✏️ (铅笔)          | `:pencil2:`                   | 修复 typo                    |
| 💩 (瞪眼)          | `:hankey:`                    | 编写需要改进的错误代码。     |
| ⏪ (双左箭头)      | `:rewind:`                    | 恢复更改。                   |
| 🔀 (双合并箭头)    | `:twisted_rightwards_arrows:` | 合并分支。                   |
| 📦 (箱子)          | `:package:`                   | 更新编译的文件或包。         |
| 👽 (面具)          | `:alien:`                     | 由于外部API更改而更新代码。  |
| 🚚 (面包车)        | `:truck:`                     | 移动或重命名文件。           |
| 📄 (文档)          | `:page_facing_up:`            | 添加或更新许可证。           |
| 💥 (爆炸)          | `:boom:`                      | 介绍突破性变化。             |
| 🍱 (装满餐盘)      | `:bento:`                     | 添加或更新资产。             |
| 👌 (OK手势)        | `:ok_hand:`                   | 由于代码审查更改而更新代码。 |
| ♿ (坐姿)          | `:wheelchair:`                | 提高可访问性。               |
| 💡 (灯泡)          | `:bulb:`                      | 记录源代码。                 |
| 🍻 (干杯)          | `:beers:`                     | 醉生梦死的写代码。           |
| 💬 (提示栏)        | `:speech_balloon:`            | 更新文字和文字。             |
| 🗃️ (卡片盒子)      | `:card_file_box:`             | 执行与数据库相关的更改。     |
| 🔊 (有声喇叭)      | `:loud_sound:`                | 添加日志。                   |
| 🔇 (静音喇叭)      | `:mute:`                      | 删除日志。                   |
| 👥 (两个人头)      | `:busts_in_silhouette:`       | 添加贡献者。                 |
| 🚸 (小盆友)        | `:children_crossing:`         | 改善用户体验/可用性。        |
| 🏗️ (吊车)          | `:building_construction:`     | 进行架构更改。               |
| 📱 (手机)          | `:iphone:`                    | 致力于响应式设计。           |
| 🤡 (小丑)          | `:clown_face:`                | 嘲笑事物。                   |
| 🥚 (彩蛋)          | `:egg:`                       | 添加一个复活节彩蛋。         |
| 🙈 (蒙眼猴子)      | `:see_no_evil:`               | 添加或更新.gitignore文件。   |
| 📸 (照相机)        | `:camera_flash:`              | 添加或更新快照。             |


## 相关链接

### 项目镜像地址
- Gitee 地址：https://gitee.com/hi-coder/rime-wubi
- Github 地址：https://github.com/mrshiqiqi/rime-wubi

### Rime 输入法引擎
- Rime 官网：https://rime.im
- Rime 下载地址：https://rime.im/download
- Rime 帮助文档：https://rime.im/docs
- 小狼毫项目地址：https://github.com/rime/weasel
- 鼠须管项目地址: https://github.com/rime/squirrel
- 中州韵项目地址：https://github.com/rime/ibus-rime
- 小狼毫外观配置说明文档：https://github.com/rime/weasel/wiki
- 小狼毫配色工具：https://bennyyip.github.io/Rime-See-Me
- 鼠须管配色工具：https://gjrobert.github.io/Rime-See-Me-squirrel

### 中书君项目
- Gitee 地址：https://gitee.com/hi-coder/WubiMaster
- Github 地址：https://github.com/mrshiqiqi/WubiMaster

---

赠人玫瑰，手有余香！🌹  
帮忙👇点个<kbd>⭐</kbd>，星标数量越多，越能让更多人发现这个项目！