//
//  Target_BusinessDanmaku.m
//  BusinessDanmaku
//
//  Created by yestin ✨ on 9/28/25.
//

#import "Target_BusinessDanmaku.h"
#import "DanmakuViewController.h"

@implementation Target_BusinessDanmaku

- (UIViewController *)Action_viewController:(NSDictionary *)params
{
    DanmakuViewController *viewController = [[DanmakuViewController alloc] init];
    if (params[@"title"]) {    
        viewController.title = params[@"title"];
    }
    return viewController;
}

@end
