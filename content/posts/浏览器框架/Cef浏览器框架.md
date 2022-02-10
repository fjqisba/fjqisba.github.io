---
title: "CEF浏览器框架"
date: 2022-01-09
tags: ["CEF"]
categories: ["浏览器框架"]
---

# Cef浏览器框架

1、Chromium不支持需要身份验证的SOCK5代理。

话说我试了几个小时，搜遍全网的资料，最后才得出这么一个结论😭

https://bugs.chromium.org/p/chromium/issues/detail?id=256785



## 浏览器命令行设置

1、启动媒体流

```c#
//主要是配置开启Media的命令参数，此配置可以允许摄像头打开摄像
settings.CefCommandLineArgs.Add("enable-media-stream", "1");
```

2、忽略https证书错误

```c#
settings.CefCommandLineArgs.Add("--ignore-certificate-errors", "1");
```

3、设置全局的代理

```c#
settings.CefCommandLineArgs.Add("proxy-server", "127.0.0.1:1080");
```

