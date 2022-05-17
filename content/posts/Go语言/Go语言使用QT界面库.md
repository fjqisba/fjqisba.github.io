---
title: "Go语言使用QT界面库"
date: 2022-04-05
tags: ["Go","GUI","QT"]
categories: ["Go语言"]
---

Go语言要使用QT库的话，装起来也是比较麻烦，使用到的库地址为:

https://github.com/therecipe/qt

1、首先需要安装QT库，我使用的版本如下，大家也可以选择更新的版本:

https://download.qt.io/official_releases/qt/5.12/5.12.10/qt-opensource-windows-x86-5.12.10.exe

2、下载完成后，安装Mingw64位版本，对应编译出来的64位Go语言程序。

3、将Go语言bin目录添加到path环境变量，在cmd中敲一下go version，看看能不能用就是了。

4、安装Go语言版本的QT库，命令如下

```powershell
go get -u -v github.com/therecipe/qt/cmd/qtsetup
go get -u -v github.com/therecipe/qt/cmd/...
```

5、在配置好环境变量的情况下运行qtsetup

```powershell
SET PATH=%PATH%;%GOPATH%\bin;

REM 配置Qt目录和Qt版本
SET QT_DIR=D:\Qt\Qt5.12.10
SET QT_API=5.12.10
SET QT_VERSION_MAJOR=5.12.10

REM 编译32位程序用386
SET GOARCH=amd64

REM 默认使用Mingw编译，使用MSVC编译的话开启下面的选项，qtsetup可以运行，但是后面qtdeploy会报cgo相关错误
REM SET QT_MSVC=true
REM SET PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build;
REM call vcvarsall.bat amd64_x86

qtsetup
```

6、编译工程的时候，使用以下命令行

```bash
qtdeploy build
```

