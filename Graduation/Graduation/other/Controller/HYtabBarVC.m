//
//  HYtabBarVC.m
//  freelife
//
//  Created by sunnyday on 2016/10/15.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import "HYtabBarVC.h"
#import "HYoneVC.h"
#import "HYTwoVCTableViewController.h"
#import "HYthreeVC.h"
#import "HYfourVC.h"
#import "HYFiveVC.h"
#import "HYtabBar.h"
#import "CustomNavigationController.h"

#import "HYNavigationVC.h"

@interface HYtabBarVC ()
// 数组
@property (nonatomic , strong) NSArray *array;
@end

@implementation HYtabBarVC
//是否支持旋转屏幕
- (BOOL)shouldAutorotate
{
    return YES;
}

//支持哪些方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

//默认显示的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
//||[self isKindOfClass:[FiveViewController class]]
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
        if ([self isKindOfClass:[HYOneVC class]]||[self isKindOfClass:[HYTwoVCTableViewController class]]||[self isKindOfClass:[HYThreeVC class]]||[self isKindOfClass:[HYFourVC class]] ||[self isKindOfClass:[HYFiveVC class]]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
            
        }
        else
        {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
   

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    //[UINavigationBar appearance];
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
//    
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    
//    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
//    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
//    
//    UITabBarItem *item = [UITabBarItem appearance];
//    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
//    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    //[self setChildViewControllers];
    //[self setTabBar];
    
    
    [self setupChildVc:[[HYOneVC alloc] init] title:@"首页" image:@"mainn" selectedImage:@"main"];
    
    [self setupChildVc:[[HYTwoVCTableViewController alloc] init] title:@"画报" image:@"huabaon" selectedImage:@"huabao"];
    
    [self setupChildVc:[[HYThreeVC alloc] init] title:@"创意" image:@"videon" selectedImage:@"video"];
    
    [self setupChildVc:[[HYFourVC alloc] init] title:@"校园" image:@"peoplen" selectedImage:@"people"];
     [self setupChildVc:[[HYFiveVC alloc] init] title:@"我的" image:@"men" selectedImage:@"me"];
    
    // 更换tabBar
    [self setValue:[[HYtabBar alloc] init] forKeyPath:@"tabBar"];
    
    //获取导航条最高权限
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:HYValue(10)]} forState:UIControlStateNormal];

    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HYMainColor} forState:UIControlStateSelected];
    
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
//    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    HYNavigationVC *nav = [[HYNavigationVC alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
//
}

// 封装

@end
