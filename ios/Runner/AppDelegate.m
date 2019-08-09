#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GOOGLEMaps/GoogleMaps.h"
@import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSServices provideAPIKey:@"AIzaSyDDrf8stnjSogSbxAN1AEkApqNKH59G5MY"];
  [FIRApp configure];
    [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

  @end
