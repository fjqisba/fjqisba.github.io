---
title: "Go语言编写GUI界面"
date: 2021-12-26
tags: ["Go","GUI"]
categories: ["Go语言"]
---

# 界面库介绍



## 1、fyne(16k收藏)

项目地址:https://github.com/fyne-io/fyne

自写的的界面库，语法和qt那种一样，体积较大，编译一个demo也要20MB。

优点:跨平台，代码维护性好。

缺点:体积较大、自写库需要时间学习。



刚刚接触可能会不太适应，需要一定的学习成本，但是使用过一段时间后，发现这个项目可能是当前最佳解决方案了。

## 2、webview(10k收藏)

项目地址:https://github.com/webview/webview

优点:基于webkit组件，体积较小。

缺点:前端写界面哦买噶。

## 3、Walk(6k收藏)

项目地址:https://github.com/lxn/walk

优点:对Windows很友好

缺点:只支持Windows

## 4、govcl(2k收藏)

项目地址:https://github.com/ying32/govcl

优点:跨平台，代码样例多。

缺点:需要模块，需要比较了解GTK这一块的知识。

## 5、qt(9k收藏)

项目地址:https://github.com/therecipe/qt

优点:熟悉QT，入手起来有优势，项目维护好。

缺点:QT配置较为复杂。

相关资料:

https://zhuanlan.zhihu.com/p/191591015

## 6、electron(4k收藏)

项目地址:https://github.com/asticode/go-astilectron

## 参考资料

https://github.com/avelino/awesome-go#gui

# 总结

由于我个人有QT使用经验，也不怕配置麻烦，最终还是选择了QT。

这真是一入QT深似海，其它界面库是路人。
