//
//  HYFiveVC.m
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYFiveVC.h"
#import "HYEnterloading.h"
#import "WSLoginView.h"
@interface HYFiveVC ()<UITabBarDelegate,UITableViewDataSource>
// tableView
@property (nonatomic , strong) UITableView *tableView;
// userImg
@property (nonatomic , strong) UIImageView *userImg;
@property (nonatomic , strong) HYEnterloading *enterLogingVC;

@end

@implementation HYFiveVC
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.jz_wantsNavigationBarVisible = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self createView];
}

- (void)createView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, HYScreenWidth, HYScreenHeight - 49 +20) style:UITableViewStylePlain];
    _tableView.backgroundColor = HYrgb(200, 200, 200);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  HYValue(100);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HYValue(150);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
//    headerView.backgroundColor = [UIColor yellowColor];
    _userImg = [[UIImageView alloc] initWithFrame:CGRectMake(HYValue(100), HYValue(50)  , 50, 50)];
    _userImg.backgroundColor = [UIColor redColor];
    headerView.userInteractionEnabled = YES;
    _userImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapUserImg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toLogin)];
    [_userImg addGestureRecognizer:tapUserImg];
    [headerView addSubview:_userImg];

    return headerView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(50))];
    CGFloat W = HYScreenWidth - HYValue(20);
    CGFloat H = W *277 / 1210;
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(HYValue(10), HYValue(15), W, H)];
    if (indexPath.row == 0) {
        image.image = [UIImage imageNamed:@"achievementShow"];
    }
    else if (indexPath.row == 1)
    {
        image.image = [UIImage imageNamed:@"achievementShow"];
    }
    else if (indexPath.row == 2)
    {
        image.image = [UIImage imageNamed:@"achievementShow"];
    }
    else
    {
        image.image = [UIImage imageNamed:@"achievementShow"];
    }
    
    
    // 这里 的颜色 和背景  设置为一样的  就可以看出分割了
    cell.contentView.backgroundColor = HYrgb(225, 225, 225);
    cell.selectionStyle = 0;
    [cell.contentView addSubview:image];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        HYLog(@"0");
//        HYSchoolWebVC *manage = [[HYSchoolWebVC alloc] init];
//        manage.jz_navigationBarBackgroundAlpha = 1;
//        [self.navigationController pushViewController:manage animated:YES];
        
    }
    else if (indexPath.row == 1)
    {
        HYLog(@"1");
        
//        HYFiveVC *manage = [[HYFiveVC alloc] init];
//        manage.jz_navigationBarBackgroundAlpha = 1;
//        [self.navigationController pushViewController:manage animated:YES];
//        
    }
    else if (indexPath.row == 2)
    {
        HYLog(@"2");
        
    }
    else if (indexPath.row == 3)
    {
        HYLog(@"3");
        
    }
    
}


- (void)toLogin
{
    HYLog(@"navi ===   %@",self.navigationController);
    HYEnterloading *enterLoging = [[HYEnterloading alloc] init];
    [self.navigationController presentViewController:enterLoging animated:YES completion:nil];
}

- (void)backToMian
{
    
    HYLog(@"1331313131");
    [self.enterLogingVC dismissViewControllerAnimated:YES completion:nil];

}
@end
