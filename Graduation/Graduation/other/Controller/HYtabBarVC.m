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
    
        if ([self isKindOfClass:[HYOneVC class]]||[self isKindOfClass:[HYTwoVCTableViewController class]]||[self isKindOfClass:[HYThreeVC class]]||[self isKindOfClass:[HYFourVC class]]) {
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
    
    
    [self setupChildVc:[[HYOneVC alloc] init] title:@"one" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[HYTwoVCTableViewController alloc] init] title:@"two" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[HYThreeVC alloc] init] title:@"three" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self setupChildVc:[[HYFourVC alloc] init] title:@"four" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    // 更换tabBar
    [self setValue:[[HYtabBar alloc] init] forKeyPath:@"tabBar"];
    
    
    
    
    
    
}
//
//- (void)setChildViewControllers
//{
//    HYOneVC *one = [[HYOneVC alloc] init];
//    CustomNavigationController *navione = [[CustomNavigationController alloc] initWithRootViewController:one];
//    navione.fullScreenPopGestureEnabled = YES;
//    
//    
//    HYTwoVC *two = [[HYTwoVC alloc] init];
//    CustomNavigationController *navitwo = [[CustomNavigationController alloc] initWithRootViewController:two];
//    navitwo.fullScreenPopGestureEnabled = YES;
//    
//    
//    HYThreeVC *three = [[HYThreeVC alloc] init];
//    CustomNavigationController *navithree = [[CustomNavigationController alloc] initWithRootViewController:three];
//    navithree.fullScreenPopGestureEnabled = YES;
//    
//    
//    HYFourVC *four = [[HYFourVC alloc] init];
//    CustomNavigationController *navifour = [[CustomNavigationController alloc] initWithRootViewController:four];
//    navifour.fullScreenPopGestureEnabled = YES;
//
//    
//    self.viewControllers = @[navione,navitwo,navithree,navifour];
//}
//
//- (void)setTabBar
//{
//    NSArray *titleArr = @[@"精选",@"流逝",@"视频",@"自我"];
//    
//    NSArray *imageArr = @[@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_me_icon",@"tabBar_friendTrends_icon"];
//    NSArray *selectedArray = @[@"tabBar_essence_click_icon",@"tabBar_new_click_icon",@"tabBar_me_click_icon",@"tabBar_friendTrends_click_icon"];
//    
//    
//    //  循环设置
//    for (int i = 0; i < 4; i ++) {
//        UIViewController *vc = self.viewControllers[i];
//        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArr[i] image:[UIImage imageNamed:imageArr[i]] selectedImage:[UIImage imageNamed:selectedArray[i]]];
//        vc.tabBarItem.tag = i;
//        
//        // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
////        HYNavigationVC *nav = [[HYNavigationVC alloc] initWithRootViewController:vc];
////        [self addChildViewController:nav];
//
//        
//    }
//    //获取导航条最高权限
//    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
//    
//}
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
//    //获取导航条最高权限
    //[[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
}

// 封装

@end
