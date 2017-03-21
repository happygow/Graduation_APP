//
//  HYOneVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYOneVC.h"
#import "HYoneCell.h"
#import "HYOneModel.h"
#import "HYHeaderView.h"
#import "HYOneTVC.h"
#import "HYTwoTVC_Design.h"
#import "HYThreeTVC_Photo.h"
#import "HYFourTVC_Life.h"
static NSString *ID = @"cell";
#define categorys  @[@"艺术",@"设计",@"摄影",@"生活",@"生活",@"设计感",@"家居",@"礼物",@"阅读",@"运动健身",@"旅行户外"]


@interface HYOneVC ()<UITableViewDelegate,UITableViewDataSource>

// currentTableView
@property (nonatomic , strong) UITableView *currentTableView;
// headerView
@property (nonatomic , strong) HYHeaderView *headerVeiw;
// cycleview
@property (nonatomic , strong) SDCycleScrollView *cycleScrollView;


// scroll action
@property (nonatomic , strong) UIScrollView *segmentScrollView;
@property (nonatomic , strong) UIImageView *currentSelectedImageView;
@property (nonatomic , strong) UIScrollView *bottomScrollView;

// title button
@property (nonatomic , strong) NSMutableArray *titlesBtns;
// pre btn
@property (nonatomic , strong) UIButton *preBtn;
// controllers
@property (nonatomic , strong) NSMutableArray *controllers;

// tableViews
@property (nonatomic , strong) NSMutableArray *tableViews;
// views
//@property (nonatomic , strong) NSArray *viewArray;

// pre offsetY
@property (nonatomic , assign) CGFloat preTableViewOffsetY;
// vcs
@property (nonatomic , strong) NSMutableArray *vcs;


@end

@implementation HYOneVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.titlesBtns = [[NSMutableArray alloc] initWithCapacity:categorys.count];
        self.controllers = [[NSMutableArray alloc] initWithCapacity:categorys.count];
        self.tableViews = [[NSMutableArray alloc] initWithCapacity:categorys.count];
        [self.view addSubview:self.bottomScrollView];
        self.headerVeiw.tabelviewArrays = [NSMutableArray arrayWithArray:self.tableViews];
        [self.view addSubview:self.cycleScrollView];
        [self.view addSubview:self.segmentScrollView];
        [self.view addSubview:self.headerVeiw];
        

    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.jz_wantsNavigationBarVisible = NO;

    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 类别条的位置变化

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    UITableView *tableView = (UITableView *)object;
    if (!(self.currentTableView == tableView)) {
        return;
    }
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    CGFloat tableViewoffsetY = tableView.contentOffset.y;
    self.preTableViewOffsetY = tableViewoffsetY;
    
    if (tableViewoffsetY >=0 && tableViewoffsetY <=126) {
        self.segmentScrollView.frame = CGRectMake(0, HYValue(200) - tableViewoffsetY, HYScreenWidth, HYValue(40));
        self.cycleScrollView.frame = CGRectMake(0, 0 - tableViewoffsetY, HYScreenWidth, HYValue(200));
    }
    else if (tableViewoffsetY < 0)
    {
        self.segmentScrollView.frame = CGRectMake(0, HYValue(200), HYScreenWidth, HYValue(40));
        self.cycleScrollView.frame = CGRectMake(0, 0, HYScreenWidth, HYValue(200));
    }
    else if(tableViewoffsetY > 136)
    {
        self.segmentScrollView.frame = CGRectMake(0, 64, HYScreenWidth, HYValue(40));
        self.cycleScrollView.frame = CGRectMake(0, -136, HYScreenWidth, HYValue(200));
    }
    
    
}

// scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView !=self.bottomScrollView) {
        return;
    }
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    UIButton *currentButton = self.titlesBtns[index];
    
    _preBtn.selected = NO;
    currentButton.selected = YES;
    _preBtn = currentButton;
    
    
    self.currentTableView = self.tableViews[index];
    for (UITableView *tableView in self.tableViews) {
        if (self.preTableViewOffsetY >=0 && self.preTableViewOffsetY <=136) {
            tableView.contentOffset = CGPointMake(0, self.preTableViewOffsetY);
        }
        else if (self.preTableViewOffsetY < 0)
        {
            tableView.contentOffset = CGPointMake(0, 0);
        }
        else if (self.preTableViewOffsetY > 136)
        {
            tableView.contentOffset = CGPointMake(0, 136);
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        if (index == 0) {
            self.currentSelectedImageView.frame = CGRectMake(spacing, self.segmentScrollView.frame.size.height - 2, currentButton.frame.size.width, 2);
        }
        else
        {
            UIButton *preBtn = self.titlesBtns[index - 1];
            float offsetX = CGRectGetMinX(preBtn.frame) - spacing*2;
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            self.currentSelectedImageView.frame = CGRectMake(CGRectGetMinX(currentButton.frame), self.segmentScrollView.frame.size.height - 2, currentButton.frame.size.width, 2);
        }
    }];
    
    
    
}

// category  点击
-(void)changeSelectedItem:(UIButton *)currentButton
{
    
    _preBtn.selected = NO;
    currentButton.selected = YES;
    _preBtn = currentButton;
    
    NSInteger index = [self.titlesBtns indexOfObject:currentButton];
    self.currentTableView = self.tableViews[index];
    for (UITableView *tableView in self.tableViews) {
        if (self.preTableViewOffsetY >= 0 && self.preTableViewOffsetY <= 136) {
            tableView.contentOffset = CGPointMake(0, self.preTableViewOffsetY);
        }
        else if(self.preTableViewOffsetY < 0)
        {
            tableView.contentOffset = CGPointMake(0, 0);
        }
        else if (self.preTableViewOffsetY > 136)
        {
            tableView.contentOffset = CGPointMake(0, 136);
        }
    }
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        if (index == 0) {
            self.currentSelectedImageView.frame = CGRectMake(spacing, self.segmentScrollView.frame.size.height - 2, currentButton.frame.size.width, 2);
            
        }
        else
        {
            UIButton *preBtn = self.titlesBtns[index - 1];
            float offsetX = CGRectGetMinX(preBtn.frame) - spacing*2;
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            self.currentSelectedImageView.frame = CGRectMake(CGRectGetMinX(currentButton.frame), self.segmentScrollView.frame.size.height - 2, currentButton.frame.size.width, 2);
        }
        self.bottomScrollView.contentOffset = CGPointMake(HYScreenWidth * index, 0);
    }];
}


- (UIScrollView *)bottomScrollView
{
    if (!_bottomScrollView) {
        _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYScreenHeight)];
        _bottomScrollView.delegate = self;
        _bottomScrollView.pagingEnabled = YES;
        
//        NSArray *colors = @[[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor whiteColor],[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor]];
        
//        HYTwoTVC_Design *twoVC = [[HYTwoTVC_Design alloc] init];
//        HYThreeTVC_Photo *threeVC = [[HYThreeTVC_Photo alloc] init];
//        HYFourTVC_Life *fourVC = [[HYFourTVC_Life alloc] init];
//            

        self.vcs = [[NSMutableArray alloc] initWithObjects:@"oneVC",@"twoVC"@"threeVC",@"fourVC", nil];
        
        
       
        for (int i = 0; i < categorys.count; i ++) {
            HYOneTVC *oneVC = [[HYOneTVC alloc] init];
            
            oneVC.view.frame = CGRectMake(HYScreenWidth * i, 0, HYScreenWidth, HYScreenHeight);
//            twoVC.view.frame = CGRectMake(HYScreenWidth * 1, 0, HYScreenWidth, HYScreenHeight);
//            threeVC.view.frame = CGRectMake(HYScreenWidth * 2, 0, HYScreenWidth, HYScreenHeight);
//            fourVC.view.frame = CGRectMake(HYScreenWidth * 3, 0, HYScreenWidth, HYScreenHeight);
        
//            oneVC.view.backgroundColor = colors[i];
            [self.bottomScrollView addSubview:oneVC.view];
//            [self.bottomScrollView addSubview:twoVC.view];
//            [self.bottomScrollView addSubview:threeVC.view];
//            [self.bottomScrollView addSubview:fourVC.view];
//            
//            
            [self.controllers addObject:oneVC];
//            [self.controllers addObject:twoVC];
//            [self.controllers addObject:threeVC];
//            [self.controllers addObject:fourVC];
//
//            
            
            [self.tableViews addObject:oneVC.tableView];
//            [self.tableViews addObject:twoVC.tableView];
//            [self.tableViews addObject:threeVC.tableView];
//            [self.tableViews addObject:fourVC.tableView];
//            
            
            
            NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
            
            [oneVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//             [twoVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//            [threeVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
//            [fourVC.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
        }
        
        self.currentTableView = self.tableViews[0];
        self.bottomScrollView.contentSize = CGSizeMake(self.controllers.count * HYScreenWidth, 0);
        
        
    }
    return _bottomScrollView;
}


- (UIScrollView *)segmentScrollView
{
    if (!_segmentScrollView) {
        _segmentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HYValue(200), HYScreenWidth, HYValue(40))];
        [_segmentScrollView addSubview:self.currentSelectedImageView];
        _segmentScrollView.showsVerticalScrollIndicator = NO;
        _segmentScrollView.showsHorizontalScrollIndicator = YES;
//        _segmentScrollView.backgroundColor = [UIColor whiteColor];
        NSInteger btnOffset = 0;
        for (int i = 0; i <categorys.count; i ++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [btn setTitle:categorys[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:fontMin];
            CGSize size = [UIButton sizeOfLabelWithCustomMaxWidth:HYScreenWidth FontSize:fontMin FilledTextString:categorys[i]];
            
            float originX = i? spacing*2 + btnOffset : spacing;
            btn.frame = CGRectMake(originX, HYValue(14), size.width, size.height);
            btnOffset = CGRectGetMaxX(btn.frame);
            
            
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            [btn addTarget:self action:@selector(changeSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
            [_segmentScrollView addSubview:btn];
            
            [self.titlesBtns addObject:btn];
            //默认选中第一个按钮
            if (i == 0) {
                
                btn.selected = YES;
                _preBtn = btn;
                
                _currentSelectedImageView.frame = CGRectMake(spacing , self.segmentScrollView.frame.size.height - 2, btn.frame.size.width, 2);
            }
            
        }
        
        _segmentScrollView.contentSize = CGSizeMake(btnOffset + spacing, 25);
    }
    return _segmentScrollView;
}


- (UIImageView *)currentSelectedImageView
{
    if (!_currentSelectedImageView) {
        _currentSelectedImageView = [[UIImageView alloc] init];
        _currentSelectedImageView.image = [UIImage imageNamed:@"nar_bgbg"];
    }
    return _currentSelectedImageView;
}

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        NSMutableArray *imageMutableArray = [NSMutableArray array];
        for (int i = 1; i < 9; i ++) {
            NSString *imageName = [NSString stringWithFormat:@"cycle_%02d.jpg",i];
            [imageMutableArray addObject:imageName];
            
        }
        
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(200)) imageNamesGroup:imageMutableArray];
    }
    
    return _cycleScrollView;
}

- (HYHeaderView *)headerVeiw
{
    if (!_headerVeiw) {
        _headerVeiw = [[HYHeaderView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, 64)];
        _headerVeiw.backgroundColor = [UIColor clearColor];
    }
    return _headerVeiw;
}


@end
