---
title: "RetDec反编译器学习"
date: 2022-04-25
tags: ["RetDec"]
categories: ["反编译"]
---

## 项目地址

https://github.com/avast/retdec

我们这些调库小子肯定首先要想办法去调用它封装好的库。

## bin2llvmir

retdec中对我们来说最有用的可能就是这个模块了，从名字可以猜到，功能为将二进制转换LLVM IR中间代码。

