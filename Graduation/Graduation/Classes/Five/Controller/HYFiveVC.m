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
@interface HYFiveVC ()

@property (nonatomic, strong) UIView *bigView;
@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIImageView *headerImageView;
// userImg
@property (nonatomic , strong) UIImageView *userImgBtn;
@property (nonatomic , strong) HYEnterloading *enterLogingVC;

@end

@implementation HYFiveVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.jz_wantsNavigationBarVisible = NO;
    [self createView];
}
- (void)createView
{
    _bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYScreenHeight)];
//    _bigView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_bigView];
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(235))];
//    _headerView.backgroundColor = [UIColor yellowColor];
    [_bigView addSubview:_headerView];
    
    CGFloat footerH = HYScreenHeight - _headerView.height - 49 -HYValue(10);
    _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerView.bottom + HYValue(2), HYScreenWidth, footerH)];
    _footerView.backgroundColor = HYMainColor;
    [_bigView addSubview:_footerView];
    
    
    
    // header
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, _headerView.height)];
    _headerImageView.image = [UIImage imageNamed:@"headerView2"];
    [_headerView addSubview:_headerImageView];
    
    //头像
    _userImgBtn = [[UIImageView alloc] initWithFrame:CGRectMake(HYScreenWidth - HYValue(120) - HYValue(34), HYValue(23), HYValue(120), HYValue(120))];
    _userImgBtn.image = [UIImage imageNamed:@"center_default_category"];
    _userImgBtn.userInteractionEnabled = YES;
    _userImgBtn.layer.borderWidth = HYValue(2);
    _userImgBtn.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    _userImgBtn.layer.masksToBounds = YES;
    _userImgBtn.layer.cornerRadius = _userImgBtn.bounds.size.width / 2;
    [_headerImageView addSubview:_userImgBtn];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toLogin)];
    [_userImgBtn addGestureRecognizer:tap];
    
    // label
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(HYValue(10), _userImgBtn.bottom + HYValue(10), HYScreenWidth - HYValue(20), HYValue(30))];
    nameLabel.text = @"1231212121";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [_headerImageView addSubview:nameLabel];
    // 九宫格
    [self createPatchWithHeight:footerH];
}

- (void)createPatchWithHeight:(CGFloat)footerH
{
    
    CGFloat width = HYScreenWidth / 3;
    NSArray *imgArr = @[@"jiazaishibai",@"jiazaishibai",@"jiazaishibai",@"jiazaishibai",@"jiazaishibai",@"jiazaishibai",@"jiazaishibai",@"jiazaishibai",@"jiazaishibai"];
    NSArray *titleArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@""];
    for (int i = 0; i <3; i ++) {
        for (int j = 0; j <3; j ++) {
            UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(j *width, i *footerH / 3, width, footerH / 3)];
            [_footerView addSubview:iconView];
            
            CGFloat imgH = HYValue(35);
            CGFloat labelH = HYValue(20);
            UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, (footerH / 3 - (imgH + labelH + HYValue(10))) / 2, width, HYValue(60))];
//            tapView.backgroundColor = [UIColor blueColor];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(skip:)];
            [tapView addGestureRecognizer:tap];
            
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake((width - imgH) / 2, 0,imgH, imgH)];
            img.image = [UIImage imageNamed:imgArr[i *3 + j]];
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10 + img.bottom, width, labelH)];
            titleLabel.text = titleArr[i * 3 + j];
            titleLabel.textColor = HYrgb(90, 90, 90);
            titleLabel.font = [UIFont systemFontOfSize:HYValue(14)];
            titleLabel.textAlignment = 1;
            [iconView addSubview:tapView];
            [tapView addSubview:img];
            [tapView addSubview:titleLabel];
            
            tapView.tag = i *3 + j + 2000;
            
            
            
        }
        
    }
    
    // 横线
    for (int i = 0; i < 2; i++)
    {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, footerH / 3 * (i + 1), HYScreenWidth, 1)];
        line.backgroundColor = [UIColor whiteColor];
        [_footerView addSubview:line];
    }
    
    // 竖线
    for (int i = 0; i < 2; i++)
    {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(width * (i + 1), 0, 1, footerH)];
        line.backgroundColor =  [UIColor whiteColor];
        [_footerView addSubview:line];
    }
    
}
#pragma mark --- 九宫格跳转 ---
- (void)skip:(UITapGestureRecognizer *)tap
{
    NSInteger tag = tap.view.tag - 2000;
    if (tag == 0)//我的课程
    {
        [self toMyCourse];
    }
    else if (tag == 1) // 我的购物车
    {
        [self toMyCart];
    }
    else if (tag == 2)// 我的订单
    {
        [self toMyOrder];
    }
    else if (tag == 3)// 我的收藏
    {
        [self toMyCollection];
    }
    else if (tag == 4)// 我的关注
    {
        [self toMyCollection];
    }
    else if (tag == 5)// 教育商城
    {
        [self toMyCollection];
    }
    else if (tag == 6)// 我想学
    {
        [self toMyCollection];
    }
    else if (tag == 7)// 设置
    {
        [self toMyCollection];
    }
    else
    {
        
    }
    
}

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
