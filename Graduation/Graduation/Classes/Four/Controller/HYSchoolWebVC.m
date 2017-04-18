//
//  HYSchoolWebVC.m
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYSchoolWebVC.h"
#import <WebKit/WebKit.h>
//#import <ShareSDKUI/ShareSDKUI.h>
#import "HYLoadingView.h"
@interface HYSchoolWebVC ()<WKNavigationDelegate>

@property (nonatomic , strong) WKWebView *webView;

@property (nonatomic, strong) HYLoadingView *loadingView;
@end

@implementation HYSchoolWebVC
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jz_wantsNavigationBarVisible = YES;
    self.navigationItem.title = @"工院校园";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 一些设置
    config.preferences = [[WKPreferences alloc] init];
    config.preferences.minimumFontSize = HYValue(10);
    config.preferences.javaScriptEnabled = YES;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, HYScreenWidth, HYScreenHeight  - 64) configuration:config];
    NSString *url = [NSString stringWithFormat:@"http://www.xzit.edu.cn/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    // 导航代理
    self.webView.navigationDelegate = self;
    // 与webview UI交互代理
    //    self.webView.UIDelegate = self;
    self.webView.allowsBackForwardNavigationGestures = NO;
    [self.view addSubview:self.webView];
    
    
    // Do any additional setup after loading the view.
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [self.view addSubview:self.loadingView];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [_loadingView removeFromSuperview];
}

-(HYLoadingView *)loadingView
{
    if (!_loadingView)
    {
        _loadingView = [[HYLoadingView alloc]initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYScreenHeight - 64) backgroundColor:nil];
    }
    return _loadingView;
}






@end
