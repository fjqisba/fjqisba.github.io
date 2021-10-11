---
title: "C++个人感想"
date: 2021-09-20
tags: ["C++"]
categories: ["C++开发"]
---

以下谈一下自己感想

##### 使用原生数据类型

很多项目喜欢自建自己的数据类型，比如std::vector、std::list，这个项目来一个qvector、qlist，另外一个项目又是QVector、QList。又或者一个很普通的int数据类型，在这个项目中是typedef char int8，另外一个项目又是typedef long long int8。

而这样给我们这些代码搬运工带来了很大的麻烦，会导致头文件不兼容，无法引用。这里我只能建议尽可能使用自己的数据类型，例如在Windows平台上我们使用的最多的是vector和string，如果上述方案仍然无法解决，最终的办法是建立自己的中间件，例如封装一个Wrapper类，重新封装一遍要调用的库函数。

