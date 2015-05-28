LeNote
======

LePtC bilingual colorful note LaTeX template

LePtC 双语彩色笔记模版

[狸笔记项目主页](http://leptc.github.io/lenote/)

详细使用说明见 sample 文件夹


2015.05.28
======

本来一直是懒洋洋地在更新这个项目，今天顺手把项目主页贴出来了，蓝后发现居然有这么多人在关注这个项目，顿时压力大增…  \_Σ:з」∠)\_

已分享 windows 系统下编译用的批处理文件，用的命令是 xelatex 编译两遍，如果出错则在第一遍后就停止。默认过滤输出信息只留下 error，能自动识别是否存在 bib 文件然后决定是否调用 bibtex。（还有一个如果编译成功则自动隐藏控制台的功能，后来我在 Sublime 内部实现了所以就注释掉了。）最后清理编译残余的中间文件。

Sublime 编辑器使用的编译配置文件也上传至 compile 文件夹，放到 sublime 的 User 文件夹即可。其它编辑器（偶只用过 notepad++ 和 Everedit…）是在编辑器内部设置绑定到 bat 文件即可。另外的 synctex.bat 和 dde.exe 是用来和 SumatraPDF 间进行 syntex 的。（Sublime 装上 LaTeXTools 插件即可，不需要这个）

Linux 下的 makefile 文件有热心童鞋分享[在这里](https://github.com/LePtC/LeNote/issues/2)。

---

对关心模版开发的童鞋：本狸的 LaTeX 一直是现学现卖的，所以模版可能开发的非常不专业，欢迎提出指导意见…

对关心笔记内容的童鞋：按计划狸笔记还需要半年到一年的时间来整理，所以现在下载的笔记看起来会比较乱…


