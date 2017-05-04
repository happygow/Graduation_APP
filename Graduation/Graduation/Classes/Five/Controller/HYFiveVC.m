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
@interface HYFiveVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) UIView *bigView;
@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIImageView *headerImageView;
// userImg
@property (nonatomic , strong) UIImageView *userImgBtn;
@property (nonatomic , strong) HYEnterloading *enterLogingVC;

@end

@implementation HYFiveVC

-(void)viewWillAppear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
     
     

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // HYrgb(65, 44, 52)
    self.view.backgroundColor = HYrgb(255, 94, 124);
       self.jz_wantsNavigationBarVisible = NO;
    [self createView];
}
- (void)createView
{

//    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(235))];

    [self.view addSubview:_headerView];
   
    
    
    
    
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, _headerView.bottom - HYValue(2) , HYScreenWidth, HYScreenHeight - _headerView.height - 39) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
    
   
    
    // header
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, _headerView.height)];
    _headerImageView.image = [UIImage imageNamed:@"headerView2"];
    _headerImageView.userInteractionEnabled = YES;
    [_headerView addSubview:_headerImageView];
    
    //头像
    _userImgBtn = [[UIImageView alloc] initWithFrame:CGRectMake((HYScreenWidth - HYValue(100) )/2, HYValue(60), HYValue(100), HYValue(100))];
    _userImgBtn.image = [UIImage imageNamed:@"light60"];
    _userImgBtn.userInteractionEnabled = YES;
    _userImgBtn.layer.borderWidth = HYValue(2);
    _userImgBtn.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    _userImgBtn.layer.masksToBounds = YES;
    _userImgBtn.layer.cornerRadius = _userImgBtn.bounds.size.width / 2;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toLogin)];
    [_userImgBtn addGestureRecognizer:tap];
    [_headerImageView addSubview:_userImgBtn];
    // label
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_userImgBtn.x - HYValue(42),  _userImgBtn.bottom + HYValue(5), HYValue(180), HYValue(70))];
    nameLabel.text = @"小屁孩";
    nameLabel.font = kFont(HYValue(23));
    
    nameLabel.numberOfLines = 0;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [_headerImageView addSubview:nameLabel];
    
    UIView *loginView = [[UILabel alloc] initWithFrame:CGRectMake(_userImgBtn.x - HYValue(20), HYValue(25),HYValue(300), HYValue(20))];
    loginView.userInteractionEnabled  = YES;
//    loginView.backgroundColor = [UIColor yellowColor];
    [_headerView addSubview:loginView];
    
    
    UILabel *registLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, HYValue(50), HYValue(30))];
    registLabel.text = @"注册";
    registLabel.textAlignment = 2;
    registLabel.userInteractionEnabled = YES;
    registLabel.textColor = [UIColor whiteColor];
    registLabel.textColor = HYWhiteColor;
    [loginView addSubview:registLabel];
    
    // line
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(registLabel.right + HYValue(5), HYValue(8), 1,  HYValue(15))];
    line.backgroundColor = HYWhiteColor;
    [loginView addSubview:line];
    
    
    UILabel *login = [[UILabel alloc] initWithFrame:CGRectMake(line.right + HYValue(5), 0, HYValue(120), registLabel.height)];
    login.text = @"已有账号？";
    login.textAlignment = 0;
    login.userInteractionEnabled = YES;
    UITapGestureRecognizer *loginTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toLogin)];
    [login addGestureRecognizer:loginTap];
    login.textColor = HYWhiteColor;
    [loginView addSubview:login];
    
    
    // 九宫格
//    [self createPatchWithHeight:footerH];
}


#pragma mark - 数据源方法
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
    return  HYValue(90);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, HYScreenWidth, (HYScreenWidth - HYValue(20)) * 277 / 1230 )];
    CGFloat W = HYScreenWidth - HYValue(20);
    CGFloat H = W * 277 / 1230;
    UIImageView *imag = [[UIImageView alloc]initWithFrame:CGRectMake(HYValue(10), HYValue(10), W, H)];
    if (indexPath.row == 0)
    {
        imag.image = [UIImage imageNamed:@"center3"];
    }
    else if (indexPath.row == 1)
    {
        imag.image = [UIImage imageNamed:@"notice3"];
        
    }
    else  if (indexPath.row == 2)
    {
        imag.image = [UIImage imageNamed:@"collect3"];
    }
    else
    {
        imag.image = [UIImage imageNamed:@"setting3"];
    }
    
    // 这里 的颜色 和背景  设置为一样的  就可以看出分割了
//    cell.contentView.backgroundColor = HYrgb(118, 67, 84);
    cell.selectionStyle = 0;
    [cell.contentView addSubview:imag];
    return cell;
}


#pragma mark - 代理方法



- (void)toMyWorks
{
//    CTGLog(@"我的作品点击");
//    CTGMyWorksViewController *myworksVc = [[CTGMyWorksViewController alloc]init];
//    myworksVc.jz_navigationBarBackgroundAlpha = 0;
//    [self.navigationController pushViewController:myworksVc animated:YES];
    
}

// 我的课程 点击
- (void)toMyCourse
{
//    CTGMyCourseVC *myCourseVC = [[CTGMyCourseVC alloc] init];
//    myCourseVC.jz_navigationBarBackgroundAlpha = 0;
//    [self.navigationController pushViewController:myCourseVC animated:YES];
}

// 购物车 点击
- (void)toMyCart
{
//    CTGShoppingCartVC*shopCartVC = [[CTGShoppingCartVC alloc]init];
//    shopCartVC.jz_navigationBarBackgroundAlpha = 1;
//    [self.navigationController pushViewController:shopCartVC animated:YES];
}

// 我的订单 点击
- (void)toMyOrder
{
//    CTGMyOrderVC *myOrderVC = [[CTGMyOrderVC alloc]init];
//    myOrderVC.jz_navigationBarBackgroundAlpha = 1;
//    [self.navigationController pushViewController:myOrderVC animated:YES];
}

// 我的收藏 点击
- (void)toMyCollection
{
//    CTGMyCollectVC *myCollectVC = [[CTGMyCollectVC alloc]init];
//    myCollectVC.jz_navigationBarBackgroundAlpha = 0;
//    [self.navigationController pushViewController:myCollectVC animated:YES];}

// 我的关注 点击
//- (void)four
//{
////    CTGMyOrgAttentionViewController *orgAttentionVC = [[CTGMyOrgAttentionViewController alloc]init];
////    orgAttentionVC.jz_navigationBarBackgroundAlpha = 0;
////    [self.navigationController pushViewController:orgAttentionVC animated:YES];
//    
}
// 教育商城 点击
- (void)toMyShop
{
//    CTGVishowWebVC *vishowVC = [[CTGVishowWebVC alloc] init];
//    vishowVC.jz_navigationBarBackgroundAlpha = 1;
//    [self.navigationController pushViewController:vishowVC animated:YES];
//    
}

// 互动交流 点击
- (void)toCommunication
{
    //    CTGMyCourseVC *myCourseVC = [[CTGMyCourseVC alloc] init];
    //    myCourseVC.jz_navigationBarBackgroundAlpha = 0;
    //    [self.navigationController pushViewController:myCourseVC animated:YES];
    
    HYLog(@"互动交流点击");
    
}

// 我想学 点击
- (void)toWantLearn
{
//    CTGWantRequireVC *wantLearn = [[CTGWantRequireVC alloc] init];
//    wantLearn.jz_navigationBarBackgroundAlpha = 0;
//    [self.navigationController pushViewController:wantLearn animated:YES];
}

// 设置 点击
- (void)toSetting
{
//    CTGSettingVC *settingVC = [[CTGSettingVC alloc] init];
//    settingVC.jz_navigationBarBackgroundAlpha = 1;
//    [self.navigationController pushViewController:settingVC animated:YES];
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
