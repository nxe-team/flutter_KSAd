# Flutter KSAd

Flutter 集成快手广告。

## 支持平台

- iOS

## 接入文档

### 引入 SDK

#### Android

暂未接入。

#### iOS

1. 允许 HTTP 访问，`ios/info.plist` 文件中添加

   ```
   <key>NSAppTransportSecurity</key>
   <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
   </dict>
   ```

   或者使用 `XCode` 编辑该文件添加 `App Transport Security Settings` -> `Allow Arbitrary Loads` 为 `YES` 。

2. 请求ATT

