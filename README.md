# local_proxy

A Flutter plugin to get system proxy settings

获取系统本地代理设置

## Getting Started

### Install 安装

```shell
flutter pub add local_proxy
```

### Usage 使用

```dart

import 'package:local_proxy/local_proxy.dart';

ProxySetting? proxySettings = await LocalProxy.getProxySettings();

```