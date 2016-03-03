//
//  MYPreviewController.m
//  3D_touch_Iphone6s
//
//  Created by yachaocn on 16/3/3.
//  Copyright © 2016年 NavchinaMacBook. All rights reserved.
//

#import "MYPreviewController.h"

@interface MYPreviewController ()

@end

@implementation MYPreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark peek quick action
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *previewAction0 = [UIPreviewAction actionWithTitle:@"回复0" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选择了0");
    }];
    
    UIPreviewAction *previewAction1 = [UIPreviewAction actionWithTitle:@"回复1" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选择了1");
    }];
    UIPreviewAction *previewAction2 = [UIPreviewAction actionWithTitle:@"回复2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"选择了2");
    }];
    NSArray *array = @[previewAction0,previewAction1,previewAction2];
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
