---
title: "Go语言菜鸟系列(一)环境搭建"
date: 2021-11-08
tags: ["笔记","Go"]
categories: ["Go语言"]
---

#### Go语言库

需要进行爬围墙:https://golang.org/

国内网站:https://studygolang.com/dl

#### 学习相关网站

https://www.topgoer.com/

#### 开发环境IDE

目前使用的是GoLand，下载地址:https://www.jetbrains.com/go/

GoLand是收费软件，需要配合无限试用插件，在GoLand插件市场，搜索Eval Reset，安装插件即可。

安装插件后，在Help -> Eval Reset中，勾选Auto reset before per restart，即每次重启都会重置试用时间。

另外，GoLand这败家玩意可能和自己从官网下载的go语言库有一些不兼容，如果出了什么问题的话，建议从File -> Settings -> GOROOT中让GoLand自己去远程下载SDK。。。。。。

#### 第一个main程序

```go
package main

import "fmt"

func main()  {
	fmt.Println("hello world")
}
```

很明显，package main中的main函数就是程序的入口。

#### 下载第三方库文件

go和python一样拥有第三方库镜像平台，在命令行中使用go get命令就可以下载，但是国内经常会出现无法访问的情况，这个时候需要设置镜像源为国内。

Windows Powershell输入以下命令，切换镜像源，有下面几种:

```powershell
go env -w GOPROXY=https://goproxy.io,direct
go env -w GOPROXY=https://goproxy.cn,direct
```

Linux输入以下命令

```bash
export GOPROXY=https://goproxy.io,direct
```

输入go env查看环境变量，来检查设置是否成功。

#### 项目结构

目前我采用的是下面这样的结构:

```
∨ TrdPackage
	⊙test.go
	⊙goproxy.go
∨ Util
	⊙string.go
	⊙time.go
∨ Model
	⊙Student.go
	⊙UrlElement.go
   go.mod
   main.go
```

TrdPackage目录放一些三方库。

Utils放一些库函数，比如字符串拼接，时间转换之类的小型函数。

Model目录专门用来存放不依赖其它任何包的结构体，因为结构体是一个比较底层的东西。

所谓项目管理，我认为可以比作是建房子，上面的砖头依赖下面的砖头，故下面的砖头不能再去依赖上面的砖头了，难度在于如何划分出哪些代码是下面的砖头。

