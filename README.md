## 写给热爱打字的你

> 我们曾是诗的国度，你我的魂早已浸透了仓颉的恩泽。   
> 相信你也曾像太白一样诗意盎然，忽复乘舟梦日边。   
> 也曾执管挥毫，畅想兰亭轶闻，放浪形骸于山水之间。   
> 你有你的故事，我有我的酒。   
> 用最初的文字，记录每一处痕迹，直到盛满整个星汉。   
> 当你用它打字时，你就成了最浪漫的诗人！  
> ——空山明月

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
|z|反查，重复上次上屏内容|
|`|自造词|
|~|以形查音|

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
|任意大写+数字|大写金额转换|
|按下等于号|激活计算器功能|

## 常用自定义配置

### 自定义候选项个数

文件位置 `wubi_ci.custom.yaml`:
```yaml
patch:
  "menu/page_size": 9
```

### 自定义候选序号样式

文件位置 `wubi_ci.custom.yaml`:
```yaml
patch:
  "menu/alternative_select_labels": [ 〡, 〢, 〣, 〤, 〥, 〦, 〧, 〨, 〩, 〸, 〹, 〺 ]
```

### 四码唯一自动上屏

文件位置 `wubi_ci.custom.yaml`
```yaml
patch:
  "speller/auto_select:" true
```


### More

更多配置详情，可前往 [Wiki 页](https://gitee.com/hi-coder/rime-wubi/wikis/Home) 进行了解。

## 中书君

中书君是针对本方案的一个管理器，旨在帮助广大用户简化 Rime 方案的配置难度。（目前中书君项目还处于 alpha 的内研阶段，beta 正式版还未正式上线。）以下是图示：

![](images/%E4%B8%AD%E4%B9%A6%E5%90%9B.png)

项目体验地址：
- Gitee 地址：https://gitee.com/hi-coder/WubiMaster
- Github 地址：https://github.com/mrshiqiqi/WubiMaster

## 捐赠

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

## QQ群

欢迎加入！

![](images/QQ.jpg)

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