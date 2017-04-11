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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"影像";
    self.jz_navigationBarBackgroundAlpha = 1;
//    self.isHiddenBack = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, HYScreenWidth, HYScreenHeight - 64) style:UITableViewStylePlain];
    self.tableview.backgroundColor = [UIColor lightGrayColor];
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
    return (HYScreenWidth - HYValue(20)) * 277 / 710 + HYValue(23);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, HYScreenWidth, (HYScreenWidth - HYValue(20)) * 277 / 710 + HYValue(23))];
    CGFloat W = HYScreenWidth - HYValue(20);
    CGFloat H = W * 277 / 710;
    UIImageView *imag = [[UIImageView alloc]initWithFrame:CGRectMake(HYValue(10), HYValue(15), W, H)];
    if (indexPath.row == 0)
    {
        imag.image = [UIImage imageNamed:@"homework"];
    }
    else if (indexPath.row == 1)
    {
        imag.image = [UIImage imageNamed:@"achievementShow"];
        
    }
    else
    {
        imag.image = [UIImage imageNamed:@"studySurvey"];
    }
    
    // 这里 的颜色 和背景  设置为一样的  就可以看出分割了
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
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
        
        HYFiveVC *manage = [[HYFiveVC alloc] init];
        manage.jz_navigationBarBackgroundAlpha = 1;
        [self.navigationController pushViewController:manage animated:YES];
        
    }
    else if (indexPath.row == 2)
    {
        HYLog(@"2");

    }

}



@end
