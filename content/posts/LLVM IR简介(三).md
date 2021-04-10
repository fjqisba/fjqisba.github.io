---
title: "LLVM IR简介(三)"
date: 2021-01-09
tags: ["LLVM"]
categories: ["LLVM"]
---



LLVM的核心是中间端表达式，即LLVM IR(Intermediate Representation)，这是一种类似汇编的底层语言。

中间端表达式有三种存在形态:

一种文本形态，可以直接被人类阅读;

一种内存对象形态，存在于运行中的C++代码中;

一种文件形态，为序列化的bitcode。







官方手册地址:[LLVM Language Reference Manual — LLVM 12 documentation](https://llvm.org/docs/LangRef.html)

#### 摘要

LLVM 语言是基于Static Single Assignment (SSA)策略的语言。LLMV IR的语言特点是：类型安全、 低级别操作、灵活且具有清晰表示**所有**高级语言的能力。它作为一个统一的代码表示，贯穿LLVM编译的各个阶段。

#### 标识符

LLVM标识符有2个基本类型：全局的和局部的。全局的标识符（函数，全局变量）以`@`字符开头。局部的标识符（注册名称，类型）以`％`字符开头

#### 注释

注释行以`;`符号开头。







