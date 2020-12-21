//
//  Target_DCBModule.m
//  MainProject
//
//  Created by 戴川 on 2020/12/21.
//

#import "Target_DCBModule.h"
#import "BViewController.h"
@implementation Target_DCBModule
- (UIViewController *)Action_viewController:(NSDictionary *)params
{
    NSString *contentText = params[@"contentText"];
    NSLog(@"params = %@",contentText);
    BViewController *viewController = [[BViewController alloc] init];
    return viewController;
}
@end
