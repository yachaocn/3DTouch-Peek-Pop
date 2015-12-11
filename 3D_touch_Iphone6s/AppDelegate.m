//
//  AppDelegate.m
//  3D_touch_Iphone6s
//
//  Created by yachaocn on 15/12/10.
//  Copyright © 2015年 NavchinaMacBook. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    动态创建一个shotrcutItem
    [self createDynamicShortcutItem];
    if (launchOptions[UIApplicationLaunchOptionsSourceApplicationKey] != nil) {
        return NO;//shortcutItem 不为空证明要加载shortcutitem，不启动应用程序。
    }else{
        return YES;
    }
    
    return YES;
}
-(void)createDynamicShortcutItem
{
    //动态创建UIApplicationShortcutItem
    
    //1. 创建一个图标的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"imageName"];
    //2.创建一个系统类型字符串
    NSString *itemType = [NSString stringWithFormat:@"%ld",(long)UIApplicationShortcutIconTypeSearch];
    //3.创建一个item对象
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:itemType localizedTitle:@"搜索" localizedSubtitle:@"可以自定义搜索哦" icon:icon userInfo:nil];
    UIApplication *application = [UIApplication sharedApplication];
    NSArray *array = application.shortcutItems;
    NSMutableArray *mutShortItems = [NSMutableArray arrayWithArray:array];
    [mutShortItems addObject:item];
    application.shortcutItems = mutShortItems;
    
}
- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler
{
    switch ([shortcutItem.type integerValue]) {
        case 5:
            NSLog(@"selected UIApplicationShortcutIconTypeSearch ");
            break;
            
        default:
            break;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
