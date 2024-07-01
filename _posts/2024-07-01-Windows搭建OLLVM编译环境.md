---
title: "Windows搭建OLLVM编译环境"
date: 2024-07-01
classes: wide
toc: true
categories:
  - 逆向
tags:
  - OLLVM
---

目前比较新的版本是17.0.6

### 0、配置基本环境

CMake \>=3.20.0

Python >= 3.8

### 1、下载LLVM源码

项目地址：https://github.com/llvm/llvm-project/releases/tag/llvmorg-17.0.6

下载Source code

### 2、下载ollvm

项目地址：https://github.com/DreamSoule/ollvm17

将项目里面的Passes文件夹替换到llvm源码里面

### 3、生成llvm.sln工程

```bash
cd llvm-project
mkdir build
cd build
cmake -G "Visual Studio 17 2022" -DCMAKE_C_FLAGS=/utf-8 -DCMAKE_CXX_FLAGS=/utf-8 -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_EH=OFF -DLLVM_ENABLE_RTTI=OFF -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_PROJECTS="clang;lld" -A x64 ../llvm
```

生成llvm.sln工程之后，定位到源码中llvm\include\llvm\IR\Function.h

把getBasicBlockList函数属性从private修改成public，之后再编译解决方案，编译全部项目大概要427GB吧。

### 4、调试LLVM PASS

随便编写一个简单的main.cpp文件

```cpp
int main(){
    int a = 0x0;
    if(a == 0x2){
        a = 0x1234;
    }else{
        a = 0x4567;
    }
    return 0x0;
}
```

配置clang工程的命令参数，例如调试OLLVM中的bcf pass，命令行如下:

```
clang.exe -S -emit-llvm D:\main.cpp -o D:\main.ll -mllvm -bcf -mllvm -debug
```

-mllvm -bcf表示开启bcf混淆

-mllvm -debug表示开启调试模式，能打印更多的日志，并生成流程图

