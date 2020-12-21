//
//  CTMediator+DCBModule_Category.m
//  DCBModule_Category
//
//  Created by casa on 2020/3/9.
//  Copyright © 2020 casa. All rights reserved.
//

#import "CTMediator+DCBModule_Category.h"

@implementation CTMediator (DCBModule_Category)

- (UIViewController *)DCBModule_viewControllerWithContentText:(NSString *)contentText
{
    /*
        BViewController *viewController = [[BViewController alloc] initWithContentText:@"hello, world!"];
     */
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"contentText"] = contentText;
    return [self performTarget:@"DCBModule" action:@"viewController" params:params shouldCacheTarget:NO];
}
@end
