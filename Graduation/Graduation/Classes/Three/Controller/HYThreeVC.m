//
//  HYThreeVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYThreeVC.h"
#import "CardLayout.h"
#import "CardSelectedLayout.h"
#import "CardCellCollectionViewCell.h"
#import "VideoListModel.h"
#import "videoDeatilVC.h"

#define RGBAColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGBColor(r,g,b)     RGBAColor(r,g,b,1.0)
#define RGBColorC(c)        RGBColor((((int)c) >> 16),((((int)c) >> 8) & 0xff),(((int)c) & 0xff))

static CGFloat collectionHeight;
static NSString *ID = @"cell";


@interface HYThreeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,CardLayoutDelegate>
{
    NSInteger pageCount ;
}

@property(nonatomic, strong)UICollectionView *cardCollectionView;
// uiview

@property(nonatomic, strong)UICollectionViewLayout *cardLayout;
@property(nonatomic, strong)UICollectionViewLayout *cardLayoutStyle1;
@property(nonatomic, strong)UICollectionViewLayout *cardLayoutStyle2;
@property(nonatomic, strong)UITapGestureRecognizer *tapGesCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
// nextpage
@property (nonatomic , strong) NSString *nextPage;

@end

@implementation HYThreeVC

- (BOOL)shouldAutorotate//是否支持旋转屏幕
{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations//支持哪些方向
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation//默认显示的方向
{
    return UIInterfaceOrientationPortrait;
}
- (void)viewWillAppear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 去除导航栏
    self.navigationController.navigationBarHidden = YES;
    _dataArray = [[NSMutableArray alloc]init];
    collectionHeight = self.view.bounds.size.height;

    self.cardLayoutStyle1 =  [[CardLayout alloc]initWithOffsetY:400];
    self.cardLayout = self.cardLayoutStyle1;
    ((CardLayout*)self.cardLayoutStyle1).delegate = self;
    
    _cardCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0 , self.view.bounds.size.width, collectionHeight) collectionViewLayout:self.cardLayout];
    [_cardCollectionView registerClass:[CardCellCollectionViewCell class] forCellWithReuseIdentifier:ID];
    _cardCollectionView.delegate = self;
    _cardCollectionView.dataSource = self;
    [_cardCollectionView setContentOffset:CGPointMake(0, 400)];
    _cardCollectionView.backgroundColor = RGBColorC(0x2D3142);
  
    [self loadDate];

    [self.view addSubview:self.cardCollectionView];
    
    
    
    
    // 默认 下拉刷新
    self.cardCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDate)];
    
    // 上拉刷新
    self.cardCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self setUpRefresh];

}

- (void)setUpRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDate];
    }];
    self.cardCollectionView.mj_header = header;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    self.cardCollectionView.mj_footer = footer;
}

- (void)loadDate
{
//    NSString *str = [self changeTime:[self getdate]];
//    NSString *urlStr = [NSString stringWithFormat:dailyList,10,str];
   
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"数据正在加载中哦..."];
    
    
    
    [HYNetworking getWithUrl:idealList refreshCache:YES params:nil success:^(id response) {
        HYLog(@"%@",response);
       // next page
        self.nextPage = [NSString stringWithFormat:@"%@",response[@"nextPageUrl"]];
        NSDictionary *videoListDict = [response objectForKey:@"videoList"];
        
        
        for (NSDictionary *dic  in videoListDict) {
            VideoListModel *model = [[VideoListModel alloc] init];
            [_dataArray addObject:model];
            HYLog(@"count1 ==  %ld",_dataArray.count );
            
            model.videoTitle = [NSString stringWithFormat:@"%@",dic[@"title"]];
            model.ImageView = [NSString stringWithFormat:@"%@",dic[@"coverForDetail"]];
            model.alphaCoverImg = [NSString stringWithFormat:@"%@",dic[@"coverBlurred"]];
            model.duration = [NSString stringWithFormat:@"%@",dic[@"duration"]];
            model.videoDescription = [NSString stringWithFormat:@"%@",dic[@"description"]];
            model.playUrl = [NSString stringWithFormat:@"%@",dic[@"playUrl"]];
        }
        [_cardCollectionView reloadData];
      
        [SVProgressHUD dismiss];
        [self endRefresh];
    } fail:^(NSError *error) {
        
    }];
}
// load more
- (void) loadMoreData
{
    if ([self.nextPage isEqualToString:@"<null>"]) {
        [self.cardCollectionView.mj_footer endRefreshingWithNoMoreData];
    }
    else
    {
    // 显示 HUD
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showWithStatus:@"数据加载中了哦..."];
        [HYNetworking getWithUrl:self.nextPage refreshCache:YES params:nil success:^(id response) {
            self.nextPage = [NSString stringWithFormat:@"%@",response[@"nextPageUrl"]];
            HYLog(@"nextpage == %@",self.nextPage);
            NSDictionary *videoListDict = [response objectForKey:@"videoList"];
            for (NSDictionary *dict in videoListDict) {
                VideoListModel *model = [[VideoListModel alloc] init];
                
                [_dataArray addObject:model];
                model.videoTitle = [NSString stringWithFormat:@"%@",dict[@"title"]];
                model.ImageView = [NSString stringWithFormat:@"%@",dict[@"coverForDetail"]];
                model.alphaCoverImg = [NSString stringWithFormat:@"%@",dict[@"coverBlurred"]];
                model.duration = [NSString stringWithFormat:@"%@",dict[@"duration"]];
                model.videoDescription = [NSString stringWithFormat:@"%@",dict[@"description"]];
                model.playUrl = [NSString stringWithFormat:@"%@",dict[@"playUrl"]];
//                model.alphaCoverImg = [NSString stringWithFormat:@"%@",dict[@""]];
//                model.alphaCoverImg = [NSString stringWithFormat:@"%@",dict[@""]];
                
            }
            [self.cardCollectionView reloadData];
            [SVProgressHUD dismiss];
            [self endRefresh];
            
        } fail:^(NSError *error) {
            [self endRefresh];
            [SVProgressHUD dismiss];
        }];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    HYLog(@"count1 ==  %ld",_dataArray.count );
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CardCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = [[CardCellCollectionViewCell alloc] init];
        
    }
    
    VideoListModel *model = _dataArray[indexPath.item];
    cell.titleLabel.text = model.videoTitle;
    
    HYLog(@"text == %@",cell.titleLabel.text);
    [cell.coverImg sd_setImageWithURL:[NSURL URLWithString:model.ImageView]];
 
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    videoDeatilVC *detail = [[videoDeatilVC alloc] init];
    detail.model = _dataArray[indexPath.row];
    
    [self.navigationController presentViewController:detail animated:YES completion:nil];

//    CGFloat offsetY = self.cardCollectionView.contentOffset.y;
//    if ([self.cardLayout isKindOfClass:[CardLayout class]]) {
//        if (!self.cardLayoutStyle2) {
//            self.cardLayoutStyle2 =  [[CardSelectedLayout alloc]initWithIndexPath:indexPath offsetY:offsetY ContentSizeHeight:((CardLayout*)self.cardLayout).contentSizeHeight];
//            self.cardLayout = self.cardLayoutStyle2;
//        }
//        else
//        {
//            ((CardSelectedLayout*)self.cardLayoutStyle2).contentOffsetY = offsetY;
//            ((CardSelectedLayout*)self.cardLayoutStyle2).contentSizeHeight = ((CardLayout*)self.cardLayout).contentSizeHeight;
//            ((CardSelectedLayout*)self.cardLayoutStyle2).selectedIndexPath = indexPath;
//            self.cardLayout = self.cardLayoutStyle2;
//        }
//        self.cardCollectionView.scrollEnabled = NO;
//        [self showMaskView]; //显示背景浮层
//        //选中的卡片不显示蒙层
//        //[((CardCellCollectionViewCell*)[self.cardCollectionView cellForItemAtIndexPath:indexPath]) setBlur:0];
//    }
//    else
//    {
//        if (!self.cardLayoutStyle1) {
//            self.cardLayoutStyle1 =  [[CardLayout alloc]initWithOffsetY:offsetY];
//            self.cardLayout = self.cardLayoutStyle1;
//            ((CardLayout*)self.cardLayoutStyle1).delegate = self;
//        }
//        else
//        {
//            ((CardLayout*)self.cardLayoutStyle1).offsetY = offsetY;
//            self.cardLayout = self.cardLayoutStyle1;
//            ((CardLayout*)self.cardLayoutStyle1).delegate = self;
//        }
//        self.cardCollectionView.scrollEnabled = YES;
//        [self hideMaskView];
//
//    }
//   
//    [self.cardCollectionView setCollectionViewLayout:self.cardLayout animated:YES];
}
-(void)showMaskView
{
    //    CATransform3DMakeTranslation(0, 0, -10);
    //    self.maskView.hidden = NO;RGBColorC(0x161821)
    self.cardCollectionView.backgroundColor = [UIColor redColor];
    //    self.closeIconView.hidden = NO;
    [self.cardCollectionView addGestureRecognizer:self.tapGesCollectionView];
}
-(void)hideMaskView
{
    //    self.maskView.hidden = YES;
    self.cardCollectionView.backgroundColor = RGBColorC(0x2D3142);
    //    self.closeIconView.hidden = YES;
    [self.cardCollectionView removeGestureRecognizer:self.tapGesCollectionView];
}

-(void)tapOnBackGround
{
       CGFloat offsetY = self.cardCollectionView.contentOffset.y;
    if ([self.cardLayout isKindOfClass:[CardLayout class]]) {
        
    }
    else
        
    {
        if (!self.cardLayoutStyle1) {
            self.cardLayoutStyle1 =  [[CardLayout alloc]initWithOffsetY:offsetY];
            self.cardLayout = self.cardLayoutStyle1;
            ((CardLayout*)self.cardLayoutStyle1).delegate = self;
        }
        else
        {
            ((CardLayout*)self.cardLayoutStyle1).offsetY = offsetY;
            self.cardLayout = self.cardLayoutStyle1;
        }
        self.cardCollectionView.scrollEnabled = YES;
        [self.cardCollectionView removeGestureRecognizer:self.tapGesCollectionView];
    }
    [self.cardCollectionView setCollectionViewLayout:self.cardLayout animated:YES];
    
}

-(UITapGestureRecognizer*)tapGesCollectionView
{
    if (!_tapGesCollectionView) {
        _tapGesCollectionView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnBackGround)];
    }
    return _tapGesCollectionView;
}



- (void)endRefresh
{
    [self.cardCollectionView.mj_header endRefreshing];
    [self.cardCollectionView.mj_footer endRefreshing];
}

-(NSTimeInterval)getdate{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]* 1000;
    return a;
}
// 获取当天的时间
-(NSString *)changeTime:(NSTimeInterval)time{
    
    time = time - 86400000 *5;
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:time/ 1000.0 ];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyyMMdd"];
    NSString *str  = [objDateformat stringFromDate: date];
    return str;
}


@end

