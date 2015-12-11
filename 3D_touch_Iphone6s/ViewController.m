//
//  ViewController.m
//  3D_touch_Iphone6s
//
//  Created by yachaocn on 15/12/10.
//  Copyright © 2015年 NavchinaMacBook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSLog(@"3dtouch availabe");
    }else{
        NSLog(@"3dtouch not availabe");
    }
//    注册一个peek 和 pop 控制器使其支持peek and pop，并使其遵守UIViewControllerPreviewingDelegate代理协议
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
    
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
    
//修改静态创建的shortcutitem对象
    NSArray *shortCutItems = [UIApplication sharedApplication].shortcutItems;
    
    UIApplicationShortcutItem *item0 = [shortCutItems objectAtIndex:0];
    UIMutableApplicationShortcutItem *mutItem0 = [item0 mutableCopy];
    mutItem0.localizedTitle = @"动态修改的title";
    
    NSMutableArray *mutShortCutItems = [NSMutableArray arrayWithArray:shortCutItems];
    [mutShortCutItems replaceObjectAtIndex:0 withObject:mutItem0];
    [UIApplication sharedApplication].shortcutItems = mutShortCutItems;
    
 
}
#pragma mark - peek and pop
//1.注册要previewing 的控制器
//2.实现UIViewControllerPreviewingDelegate代理方法
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0)
{
//    peek
    UIViewController *childVC = [[UIViewController alloc] init];
    childVC.view.backgroundColor = [UIColor yellowColor];
    childVC.preferredContentSize = CGSizeMake(0.0,300);
    
    CGRect rect = CGRectMake(10, location.y - 10, self.view.frame.size.width - 20,20);
    previewingContext.sourceRect = rect;
    return childVC;
    
    
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0)
{
//    pop
    [self showViewController:viewControllerToCommit sender:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
