# vp_module

## [混合开发测试Module](https://github.com/Darksiderlyd/flutter_module) 
打包aar然后放到[AndroidStructure dev/lyd_clean 分支下的repo文件夹下没有的话可以新建](https://github.com/Darksiderlyd/AndroidStructure)

## [flutter Module环境配置和打包命令](https://www.jianshu.com/p/fbe9ec3a8590)

[//]: # (flutter run --dart-define=DART_APP_ENV=dev)

[//]: # (flutter run --dart-define=DART_APP_ENV=release)

```
dev或者release debug包 
flutter build aar --no-release --no-profile --dart-define=DART_APP_ENV=dev
flutter build aar --no-release --no-profile --dart-define=DART_APP_ENV=release
```

```
dev或者release release包
flutter build aar --no-debug --no-profile --dart-define=DART_APP_ENV=dev
flutter build aar --no-debug --no-profile --dart-define=DART_APP_ENV=release
```


## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).
