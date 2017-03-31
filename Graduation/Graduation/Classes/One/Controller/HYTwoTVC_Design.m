//
//  HYTwoTVC_Design.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/17.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYTwoTVC_Design.h"
#import "HYOneModel.h"
#import "HYoneCell.h"

@interface HYTwoTVC_Design ()<UITableViewDelegate,UITableViewDataSource>



@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIViewController *controller;
@end
static NSString *ID = @"cell";
@implementation HYTwoTVC_Design

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.tableView];
        [self loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    
}

- (void)createView
{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYScreenHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[HYoneCell class] forCellReuseIdentifier:ID];
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(242))];
    tableHeaderView.backgroundColor = [UIColor whiteColor];
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(HYValue(182), 0, 0, 0);
    _tableView.tableHeaderView = tableHeaderView;
    
}


- (void)loadData
{
    [HYNetworking getWithUrl:designURL refreshCache:YES params:nil success:^(id response) {
        HYLog(@"data ===   %@",response);
        NSDictionary *dictData = [response objectForKey:@"data"];
        for (NSDictionary *dic in dictData) {
            HYOneModel *model = [[HYOneModel alloc] initWithDictionary:dic];
            [_dataArray addObject:model];
            
            HYLog(@"count =======     %ld",self.dataArray.count);
            
            
        }
        
        
        [self.tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    HYLog(@"count1 ==  %ld",(unsigned long)_dataArray.count );
    return _dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYoneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HYoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
    
}


@end
