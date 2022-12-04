---
title: "Flutter逆向"
date: 2022-11-06
tags: ["Flutter","Dart"]
categories: ["安卓逆向"]
---

​	Flutter难就难在Dart部分的逆向，这又是一套字节码执行引擎，目前没有好用的反编译工具。

1、先了解了解Dart语言吧

https://dart.dev/overview

博客

https://blog.tst.sh/reverse-engineering-flutter-apps-part-1/



2、来到项目地址https://github.com/dart-lang/sdk，发现搭建项目需要准备以下条件:

- Visual Studio 2019
- gclient，看起来像是Google自家的项目管理工具，下载地址是:https://www.chromium.org/developers/how-tos/depottools/
- python3，下载地址略
- ninja，下载地址https://github.com/ninja-build/ninja/releases，添加到环境变量吧。
- Windows调试SDK，安装方法https://stackoverflow.com/questions/46237620/how-to-install-debugging-tools-with-visual-studio-2017-installer
- 添加环境变量DEPOT_TOOLS_WIN_TOOLCHAIN为0



3、执行下载源码指令

```powershell
fetch dark
```



4、生成项目

```bash
cd sdk
python ./tools/build.py --no-goma --mode release --arch x64 create_sdk
```



## 参考资料

https://www.pnfsoftware.com/blog/dart-aot-snapshot-helper-plugin-to-better-analyze-flutter-based-apps/
