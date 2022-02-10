---
title: "Go语言常用时间转换"
date: 2022-01-17
tags: ["Go","时间"]
categories: ["Go语言"]
---

#### 时间戳转换为时间

秒级别转换

```go
timeStamp := 1642429952
timeStr := time.Unix(int64(timeStamp),0).Format(time.RFC3339)
fmt.Println(timeStr)
```

毫秒级别转换

```go
timeStamp := 1642430127727
timeStr := time.UnixMilli(int64(timeStamp)).Format(time.RFC3339)
fmt.Println(timeStr)
```

#### 时间转换为时间戳

秒级别转换

```go
timeStamp := 1642429952
timeStr := time.Unix(int64(timeStamp),0)
fmt.Println(timeStr.Unix())
```

毫秒级别转换

```go
timeStamp := 1642430127727
timeStr := time.UnixMilli(int64(timeStamp))
fmt.Println(timeStr.UnixMilli())
```

