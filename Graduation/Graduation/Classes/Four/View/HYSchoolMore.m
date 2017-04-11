//
//  HYSchoolMore.m
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYSchoolMore.h"

@interface HYSchoolMore()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;

@end



@implementation HYSchoolMore

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, HYScreenWidth, frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.separatorStyle = 0;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_tableView];
    }
    return self;
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
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.selectionStyle = 0;
    [cell.contentView addSubview:imag];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedWithIndex:)])
    {
        [self.delegate selectedWithIndex:indexPath.row];
    }
}







@end
