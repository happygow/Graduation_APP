//
//  HYTwoViewDidClickVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/3.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYTwoViewDidClickVC.h"
#import <WebKit/WebKit.h>
#import "HYLoadingView.h"

@interface HYTwoViewDidClickVC ()<WKNavigationDelegate>

// web
@property (nonatomic , strong) WKWebView *webView;

// big
@property (nonatomic , strong) UIView *bigView;

// back btn
@property (nonatomic , strong) UIButton *backBtn;

@end

@implementation HYTwoViewDidClickVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
  self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
}


- (void)loadData
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    webView.backgroundColor = [UIColor whiteColor];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.web_url]]];
//    });
    
    
    HYLog(@"imageurl %@",self.web_url);
    // important
    webView.scrollView.contentInset = UIEdgeInsetsMake(HYValue(500), 0, 0, 0);
    [self.view addSubview:webView];

    
    _bigView = [[UIView alloc] initWithFrame:CGRectMake(0, -HYValue(500), HYScreenWidth, HYValue(500))];
//    _bigView.backgroundColor = [UIColor yellowColor];
    
     UILabel *mainTitle = [[UILabel alloc] initWithFrame:CGRectMake(HYValue(20), HYValue(50), HYScreenWidth - HYValue(40), HYValue(50))];
    mainTitle.numberOfLines = 0;
    mainTitle.textColor = [UIColor darkGrayColor];
    mainTitle.textAlignment = NSTextAlignmentCenter;
    mainTitle.font = [UIFont systemFontOfSize:HYValue(20)];
    mainTitle.text = self.mainTitle;
    [self.bigView addSubview:mainTitle];

    UILabel *sub_title = [[UILabel alloc] initWithFrame:CGRectMake(mainTitle.x, mainTitle.bottom + HYValue(5), mainTitle.width, HYValue(40))];
    sub_title.numberOfLines = 0;
    sub_title.textAlignment = NSTextAlignmentCenter;
    sub_title.textColor = [UIColor darkGrayColor];
    sub_title.font = [UIFont systemFontOfSize:HYValue(16)];
    sub_title.text = self.sub_title;
    [self.bigView addSubview:sub_title];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(HYValue(30), sub_title.bottom + HYValue(5), HYScreenWidth - HYValue(60), HYScreenWidth - HYValue(60))];
    [image sd_setImageWithURL:[NSURL URLWithString:self.imageUrl] placeholderImage:nil];
    [self.bigView addSubview:image];
    
    
    [webView.scrollView addSubview:_bigView];
    
    
    // back btn
    _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(HYValue(15), HYValue(15), HYValue(15), HYValue(15))];
    [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.bigView addSubview:_backBtn];
    
    //去掉黑色框框
    webView.scrollView.contentOffset= CGPointMake(0, -552);
    // 是自己瞎写的,根据不同情况设定,黑框越大,这个数就越小!是负数的小!!
}


- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
