//
//  OCHomeViewController.m
//  MainProject
//
//  Created by 戴川 on 2020/12/22.
//

#import "OCHomeViewController.h"
#import <DCAModule_Category/CTMediator+DCAModule_Category.h>
#import <DCSwiftModuleA_Extension/DCSwiftModuleA_Extension-Swift.h>
#define KScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
@interface OCHomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;


@end

@implementation OCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"OCHomeViewController";
    
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight - 88);
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // Objective-C -> Category -> Objective-C
        UIViewController *viewController = [[CTMediator sharedInstance] DCAModule_aViewController];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if (indexPath.row == 1) {
        NSLog(@"Objective-C -> Category -> Swift");
        
    }
    if (indexPath.row == 2) {
        NSLog(@"Objective-C -> Extension -> Objective");

    }
    if (indexPath.row == 3) {
        [[CTMediator sharedInstance] DCSwiftModuleA_Extension_ShowSwiftAViewControllerWithViewController:self callback:^(NSString *result) {
            NSLog(@"callback.string = %@",result);
        }];
        
    }
}

#pragma mark - getters and setters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
                        @"Objective-C -> Category -> Objective-C",
                        @"Objective-C -> Category -> Swift",
                        @"Objective-C -> Extension -> Objective-C",
                        @"Objective-C -> Extension -> Swift",
                        ];
    }
    return _dataSource;
}

@end
