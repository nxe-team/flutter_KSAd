#import "FlutterKsadPlugin.h"
#if __has_include(<flutter_ksad/flutter_ksad-Swift.h>)
#import <flutter_ksad/flutter_ksad-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_ksad-Swift.h"
#endif

@implementation FlutterKsadPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterKsadPlugin registerWithRegistrar:registrar];
}
@end
