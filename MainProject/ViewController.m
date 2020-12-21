//
//  ViewController.m
//  MainProject
//
//  Created by 戴川 on 2020/12/21.
//

#import "ViewController.h"
#import <DCAModule_Category/CTMediator+DCAModule_Category.h>
@interface ViewController ()
@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Home";
    [self.view addSubview:self.pushButton];
    
}
- (void)push{
    UIViewController *viewController = [[CTMediator sharedInstance] DCAModule_aViewController];
        
    [self.navigationController pushViewController:viewController animated:YES];
}
- (UIButton *)pushButton {
    if (!_pushButton) {
        _pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
        [_pushButton setTitle:@"push" forState:UIControlStateNormal];
        _pushButton.backgroundColor = [UIColor redColor];
        [_pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}


@end
