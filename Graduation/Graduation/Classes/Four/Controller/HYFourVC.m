//
//  HYFourVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYFourVC.h"
#import "HYSegmentView.h"
#import "HYSchoolMore.h"
#import "HYSchoolWebVC.h"
#import "HYFiveVC.h"

@interface HYFourVC()<UITableViewDelegate, UITableViewDataSource>
// tableview
@property (nonatomic , strong) UITableView *tableview;
@end

@implementation HYFourVC
- (void)viewWillAppear:(BOOL)animated
{
       self.navigationController.navigationBar.hidden =  NO;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


-(void)viewDidLoad {
    
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationItem.title = @"校园";
//    self.navigationController.navigationBar.backgroundColor = HYMainColor;
    [self.navigationController.navigationBar setBarTintColor:HYMainColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    self.navigationController.navigationBar.hidden =  NO;
//    self.jz_navigationBarTintColor = HYMainColor;
//    self.isHiddenBack = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, HYScreenWidth, HYScreenHeight - 64) style:UITableViewStylePlain];
    self.tableview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  HYValue(150);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(140))];
    CGFloat W = HYScreenWidth - HYValue(20);
    CGFloat H = W * 277 / 810;
    UIImageView *imag = [[UIImageView alloc]initWithFrame:CGRectMake(HYValue(10), HYValue(15), W, H)];
    if (indexPath.row == 0)
    {
        imag.image = [UIImage imageNamed:@"campusNetwork"];
    }
    else if (indexPath.row == 1)
    {
        imag.image = [UIImage imageNamed:@"campusView"];
        
    }
//    else
//    {
//        imag.image = [UIImage imageNamed:@""];
//    }
    
    // 这里 的颜色 和背景  设置为一样的  就可以看出分割了
        cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = 0;
    [cell.contentView addSubview:imag];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        HYLog(@"0");
        HYSchoolWebVC *manage = [[HYSchoolWebVC alloc] init];
        manage.jz_navigationBarBackgroundAlpha = 1;
        [self.navigationController pushViewController:manage animated:YES];
        
    }
    else if (indexPath.row == 1)
    {
        HYLog(@"1");
        
        HYSchoolWebVC *manage = [[HYSchoolWebVC alloc] init];
        manage.jz_navigationBarBackgroundAlpha = 1;
        [self.navigationController pushViewController:manage animated:YES];
        
        
//        HYFiveVC *manage = [[HYFiveVC alloc] init];
//        manage.jz_navigationBarBackgroundAlpha = 1;
//        [self.navigationController pushViewController:manage animated:YES];
        
    }
    else if (indexPath.row == 2)
    {
        HYLog(@"2");

    }

}



@end
