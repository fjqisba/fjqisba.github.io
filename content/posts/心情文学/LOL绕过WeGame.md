---
title: "LOL绕过WeGame"
date: 2022-01-21
tags: ["LOL"]
categories: ["心情文学"]
---

腾讯为了KPI，强迫用户使用WeGame，在未安装WeGame的情况下禁止更新、禁止运行LOL。。。。

只能说腾讯成功恶心到了我这个从来不用WeGame的LOL玩家。

绕过WeGame可以考虑手动下载更新补丁，参考项目

https://github.com/DongJiangYue-Team/CN_LOL_DNF-Client-Patch-Download

其实LOL的更新补丁下载地址规律也很明显，举个例子:

```
<
http://down.qq.com/lol/patch/4266/LOL_V4.2.6.5-V4.2.6.6_PATCH.exe
referer: http://down.qq.com/
User-Agent: Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; .TDCH 7.0;)
>
<
http://down.qq.com/lol/patch/4266/LOL_V4.2.6.6_PATCH.7z.001
referer: http://down.qq.com/
User-Agent: Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; .TDCH 7.0;)
>
<
http://down.qq.com/lol/patch/4266/LOL_V4.2.6.6_PATCH.7z.002
referer: http://down.qq.com/
User-Agent: Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; .TDCH 7.0;)
>
<
http://down.qq.com/lol/patch/4266/LOL_V4.2.6.6_PATCH.7z.003
referer: http://down.qq.com/
User-Agent: Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 10.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; .TDCH 7.0;)
>
```

把这玩意拷到IDM里面，就能直接下载了。
