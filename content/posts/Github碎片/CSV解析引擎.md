---
title: "CSV解析引擎"
date: 2021-03-14
tags: ["开源项目","csv","parser"]
categories: ["Github碎片"]
---

因为工作的需要，不可避免地要对csv进行解析，但是自己写解析引擎的话只能写几句玩具代码，上限太低，不堪入目，所以一个好用的CSV解析引擎库就显得比较重要的。

#### [fast-cpp-csv-parser](https://github.com/ben-strasser/fast-cpp-csv-parser)

轻量小巧，好用，只需要包含一个头文件即可使用。特点如下：

- 可以按照标题将不同列的信息解析出来
- 可以使用多线程技术读取CSV文件并且解析
- 可以在编译时使用模板启用和禁用解析功能（例如转义字符串），按需定制功能
- 可以在合理的时间内读取多个GB大小的文件
- 支持自定义列分隔符（即支持制表符分隔值文件），引用转义字符串，自动空格修剪
- 使用`*`nix和Windows换行符，并自动忽略UTF-8 BOM
- 具有足够上下文以格式化有用的错误消息的异常类。 what（）返回错误消息准备好显示给用户



#### [rapidcsv](https://github.com/d99kris/rapidcsv)

使用了C++ 11，支持多平台。只需要包含一个头文件即可使用。个人认为就提供的库接口函数来说，`rapidcsv`比`fastcsv`更加简单，不过代价可能就是牺牲了一些效率吧。作者更新也挺勤劳。个人认为这个比较适合用来解决平时的一些小需求。

