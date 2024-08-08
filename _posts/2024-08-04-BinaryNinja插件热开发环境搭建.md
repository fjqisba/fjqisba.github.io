---
title: "BinaryNinja插件热开发环境搭建"
date: 2024-08-04
classes: wide
toc: true
categories:
  - 逆向
tags:
  - 新手教程
  - BinaryNinja
---

工欲善其事，必先利其器，环境不配好，开发两行泪啊。

官方文档：https://docs.binary.ninja/dev/index.html

关于热重载：https://github.com/Vector35/binaryninja-api/discussions/1734

这里我就用VSCODE了

### 环境配置

1、Python:Create Environment，搞个venv虚拟环境，搞逆向的，其实吧，很可能要安装各种环境，不用虚拟环境，等死吧。

2、虚拟Python环境下安装debugpy

```
.\.venv\Scripts\python.exe -m pip install debugpy
```

3、打开BinaryNinja，到Settings中填写Python Virtual Environment Site-Packages，设置为Python虚拟环境目录Lib/site-packages，不然BinaryNinja没库环境可用了



4、C:\Users\fjqisba\AppData\Roaming\Binary Ninja\plugins目录下面，直接作为工程根目录开搞，创建一个myplugin.py文件，将BinaryNinja\python目录里面的binaryninja和binaryninjaui两个目录直接拷贝到工程根目录下



5、vscode搞个launch.json，配置这样写，不懂pathMappings就不要设置，下不了断点害死人。。。

```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python Debugger: Remote Attach",
            "type": "debugpy",
            "request": "attach",
            "connect": {
                "host": "localhost",
                "port": 5678
            },
        }
    ]
}
```



6、myplugin.py编写测试代码如下

```python
from binaryninja import *

def MainEntry():
	show_message_box("Do Nothing", "Congratulations! You have successfully done nothing.\n\n" +
					 "Pat yourself on the back.", MessageBoxButtonSet.OKButtonSet, MessageBoxIcon.ErrorIcon)
	pass
```



7、打开Binary Ninja，控制台执行命令先开启远程调试服务

```
connect_vscode_debugger(port=5678)
```

开启之后vscode之后就可以点击Start Debugging挂上去了



8、Binary Ninja直接控制台去调用命令

```
import myplugin
import importlib
importlib.reload(myplugin);myplugin.MainEntry()
```

下个断点，控制台Ctrl + Enter执行命令，能断下来就算成功了。

改完代码，每次运行这个命令就行
