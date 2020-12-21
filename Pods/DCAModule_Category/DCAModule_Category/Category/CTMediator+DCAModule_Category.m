//
//  CTMediator+DCAModule_Category.m
//  DCAModule_Category
//
//  Created by casa on 2020/3/9.
//  Copyright © 2020 casa. All rights reserved.
//

#import "CTMediator+DCAModule_Category.h"
#import <UIKit/UIKit.h>
@implementation CTMediator (DCAModule_Category)


- (UIViewController *)DCAModule_aViewController{
    //    AViewController *vc = [[AViewController alloc]init];
    return [self performTarget:@"DCAModule" action:@"viewController" params:nil shouldCacheTarget:NO];
}

@end
