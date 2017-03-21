//
//  HYTwoVCTableViewController.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/28.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYTwoVCTableViewController.h"
#import "HYTwoCell.h"
#import "HYTwoModel.h"
#import "HYTwoViewDidClickVC.h"


/******************  SDWebImage  *********************/

@interface SDWebImageManager (cache)

- (BOOL)memoryCacheImageExistsForURL:(NSURL *)url;

@end

@implementation SDWebImageManager (cache)

- (BOOL)memoryCacheImageExistsForURL:(NSURL *)url {
    
    NSString *key = [self cacheKeyForURL:url];
    return ([self.imageCache imageFromMemoryCacheForKey:key] != nil) ? YES : NO;
}

@end



@interface HYTwoVCTableViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *selectDict;

@end

@implementation HYTwoVCTableViewController
static NSString *const ID = @"register";

- (NSMutableArray *)dateArray {
    
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableDictionary *)selectDict {
    
    if (!_selectDict) {
        
        _selectDict = [NSMutableDictionary dictionary];
    }
    return _selectDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jz_wantsNavigationBarVisible = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 去掉分割线
    
    [self.tableView registerClass:[HYTwoCell class] forCellReuseIdentifier:ID];
//    self.navigationItem.title = @"画报";
    [self loadData];
    
    
    // 默认 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self setUpRefresh];
}


- (void)setUpRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_header = header;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    self.tableView.mj_footer = footer;
}

- (void)loadData
{
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"数据正在加载中哦..."];
    [HYNetworking getWithUrl:huabaoUrl refreshCache:YES params:nil success:^(id response) {

        NSDictionary *dicData = [response[@"data"] objectForKey:@"articles"];
        
            for (NSDictionary *dict in dicData) {
                HYTwoModel *model = [[HYTwoModel alloc] initWithDictionary:dict];

                [_dataArray addObject:model];
    
                  HYLog(@" mode; == %@",_dataArray);
                HYLog(@" dataarray == %ld",_dataArray.count);

                
            }
   

        
        [SVProgressHUD dismiss];
         [self.tableView reloadData];
    } fail:^(NSError *error) {
        
    }];
    
    
}

- (void)loadMoreData
{
    [self loadData];
}

- (void)endRefresh
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 多少组   这个东西一定不能少   弄了好几天
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.dateArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HYValue(HYScreenHeight/ 1.9);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    HYLog(@"count1 ==  %ld",(unsigned long)_dataArray.count );
    return _dataArray.count;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
     HYTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (!cell) {
        cell = [[HYTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = _dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYTwoViewDidClickVC *detailVC = [[HYTwoViewDidClickVC alloc] init];
    HYTwoModel *model = _dataArray[indexPath.row];
    detailVC.mainTitle = model.mainTitle;
    detailVC.sub_title = model.sub_title;
    detailVC.web_url = model.web_url;
    detailVC.imageUrl = model.coverImageUrl;
    detailVC.jz_wantsNavigationBarVisible = NO;
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
