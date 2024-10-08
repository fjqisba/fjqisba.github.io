---
title: "Windows搭建UE项目环境"
date: 2024-07-09
classes: wide
toc: true
categories:
  - 逆向
tags:
  - 新手教程
  - UE4
  - UE5
---

哎，逆向有的时候也得像开发人员一样去配置一些麻烦的环境。

## 必备工具

Visual Studio，在Visual Studio Installer里面勾选一下使用C++的游戏开发。

Android Studio，最新版就行了

## 安装UE5安卓开发环境

UE4支持32位和64位，而UE5只支持arm64了。

从官网搞个Epic Games Launcher装一装，这里以UE5.4.2为例子，安装的时候点开选项，目标平台记得勾选Android。

### 配置Android环境

进入项目目录C:\Program Files\Epic Games\UE_5.4\Engine\Extras\Android，运行SetupAndroid.bat，运行前也可以先检查下面的环境：

1、环境变量ANDROID_HOME，值为AndroidSDK根目录

2、Android Studio中进入设置Android SDK -> SDK Tools，安装Android SDK Command-line Tools(latest)

没配置JAVA_HOME环境，SetupAndroid.bat脚本默认就会使用Android Studio的jbr环境，就在Android Studio软件目录下面，jbr就是jet brains自己封装的jdk环境，版本比较高，是Java SE 17  (jdk 17.0.10)

其实SetupAndroid.bat就是下载和当前UE版本适配的platform-tools、Build-Tools、 NDK、CMake这些工具罢了，然后还设置了JAVA_HOME、NDK_ROOT、platform-tools等相关环境变量

### 配置UE项目设置

搞个UE5的Demo，进入项目设置

平台 -> Android -> 未针对Android平台配置项目 -> 立即配置 -> 接受SDK证书

平台 -> Android SDK，配置：

Location of Android SDK，填安卓SDK根目录

Location of Android NDK，填之前SetupAndroid.bat安装的NDK目录，例如C:\MyLib\AndroidSDK\ndk\25.1.8937393

Location of JAVA，这里就填jbr目录就行了，例如C:\App\Android Studio\jbr

SDK API Level ，可以填latest或者matchndk

NDK API Level，填指定的版本例如android-26，或者填latest

在测试环境下，也以在项目设置里面勾选Disable verify OBB on first start/update选项

之后就可以成功编译项目了

## 安装UE4安卓开发环境

UE4说不定比UE5更常见，因此也试试安装UE4.26.2

### CodeWorks

安卓开发可以考虑使用CodeWorks，一键配置环境，可以参考下面的文档

https://docs.unrealengine.com/4.27/zh-CN/SharingAndReleasing/Mobile/Android/InstallingAndroidCodeWorksAndroid/

https://ue5wiki.com/wiki/52d36a/

安装之后，环境变量安排得明明白白

ANDROID_HOME设置为D:\App\NVPACK\android-sdk-windows

ANDROID_NDK_ROOT设置为D:\App\NVPACK\android-ndk-r18b

GRADLE_HOME设置为D:\App\NVPACK\gradle-4.4.1

JAVA_HOME设置为D:\App\NVPACK\jdk1.8.0_77

NDK_ROOT设置为D:\App\NVPACK\android-ndk-r18b

NDKROOT设置为D:\App\NVPACK\android-ndk-r18b

NVPACK_NDK_TOOL_VERSION设置为4.9

NVPACK_NDK_VERSION设置为android-ndk-r18b

NVPACK_ROOT设置为D:\App\NVPACK

Path路径添加

D:\App\NVPACK\android-sdk-windows\extras\android\support

D:\App\NVPACK\android-sdk-windows\build-tools

D:\App\NVPACK\android-sdk-windows\platform-tools

D:\App\NVPACK\android-sdk-windows\tools

D:\App\NVPACK\gradle-4.4.1\bin

D:\App\NVPACK\jdk1.8.0_77\bin

你只需要自行改一改ndk版本就行了，不使用CodeWorks，那就自行配置，接着往下看

### 配置Android环境

需要注意的是UE4.26.2正常情况下不能用太高的JDK版本，这是因为UE4.26.2使用的gradle是版本是6.1.1，而这个版本的gradle对应的jdk版本号是1.8.0_77，因此去官网https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html，搞一个jdk-8u77-windows-x64.exe之类的就行了



进入项目目录C:\Program Files\Epic Games\UE_4.26\Engine\Extras\Android，运行SetupAndroid.bat，运行前也可以先检查下面的环境：

1、环境变量ANDROID_HOME，值为AndroidSDK根目录

2、Android Studio中进入设置Android SDK -> SDK Tools，安装Android SDK Command-line Tools(latest)

对于现在的SetupAndroid.bat来说，得改点东西，sdkmanager.bat位置变了，将脚本里面的

```
set SDKMANAGER=%STUDIO_SDK_PATH%\tools\bin\sdkmanager.bat
```

修改为

```
set SDKMANAGER=%STUDIO_SDK_PATH%\cmdline-tools\latest\bin\sdkmanager.bat
```

运行之后脚本就给你配好了platform-tools、build-tools;28.0.3、ndk;21.4.7075529(注意版本号)，还帮你设置好了环境变量JAVA_HOME。。。然而这个环境变量是错的，因为JBR版本太高了

### 配置UE项目设置

搞个UE4的Demo，进入项目设置

平台 -> Android -> 未针对Android平台配置项目 -> 立即配置 -> 接受SDK证书

平台 -> Android SDK，配置：

Location of Android SDK，填安卓SDK根目录

Location of Android NDK，填之前SetupAndroid.bat安装的NDK目录，例如C:\MyLib\AndroidSDK\ndk\21.4.7075529

Location of JAVA，得填旧版本的JDK目录，例如C:\MyLib\Java\jdk1.8.0_77

SDK API Level ，可以填android-30

NDK API Level，可以填android-21

在测试环境下，也以在项目设置里面勾选 **禁用首次开始/更新时验证OBB** 选项

------

之后就可以编译项目了，如果是在下载gradle的时候遇到问题，如下所示:

```
Downloading https://services.gradle.org/distributions/gradle-6.1.1-all.zip
Exception in thread "main" javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

这大概率还是坑爹的JDK惹出来的麻烦，可以考虑先将JAVA_HOME切换成JBR，再去执行gradlew.bat，让新版本的JDK去安装gradle，下完了之后再将JAVA_HOME切回旧版本，为什么可以这么做呢，因为gradle一般都是系统全局共享的。。。

------

如果是gradle在下载jar包的时候依旧网络出错，类似于下面这种

```
Could not resolve all artifacts for configuration ':classpath'.
Could not resolve org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.3.72.
Could not resolve org.ow2.asm:asm:7.0.
```

去浏览器访问https://jcenter.bintray.com，拿到根证书DigiCert Global Root G2.crt，执行下面的命令

```
cd C:\MyLib\Java\jdk1.8.0_77\jre\lib\security
keytool -importcert -file "D:\DigiCert Global Root G2.crt" -keystore cacerts -storepass changeit -noprompt -alias jcenter.bintray.com
```

之后如果你的飞机网络如果正常的话，应该就能下载jar包了。。。

------

如果在编译的时候出现dx.bat这种奇怪的东东，那么很明显是Build-tool对不上，因为UE4.26.2只支持29.0.2左右版本的编译工具链

```
Build-tool 35.0.0 is missing DX at C:\MyLib\AndroidSDK\build-tools\35.0.0\dx.bat
```

额，目前找到的办法是删掉高版本的C:\MyLib\AndroidSDK\build-tools

------

都这样了用UE编译还是出错的话，建议用Android Studio加载Intermediate目录下面的安卓项目，然后记得去设置里面将gradle JDK切换成低版本的jdk 1.8.0_77，等待Android Studio编译成功后，执行下面的操作：

Android Studio 中的Build 选项 -> Clean project

Android Studio 中的File 选项 -> Invalidate caches...

这个时候再切换到UE去编译，或许就可以继续往下走了

## 参考资料

http://www.qxzx.xyz/posts/tech/android-gradle-setting/

