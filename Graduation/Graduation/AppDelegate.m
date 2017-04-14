//
//  AppDelegate.m
//  Graduation
//
//  Created by LeeBruce on 17/3/21.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "HYtabBarVC.h"
#import "XZMCoreNewFeatureVC.h"
#import "CALayer+Transition.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAll;//支持所有方向
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    
//    BOOL isFirstLogin = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLogin"] boolValue];
//    if (isFirstLogin) {
//        //是第一次
//        WSMovieController *wsCtrl = [[WSMovieController alloc]init];
////        wsCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]];
//        self.window.rootViewController = wsCtrl;
//        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"isFirstLogin"];
//    }else{
//        //不是首次启动
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[HYtabBarVC alloc] init];
    [self.window makeKeyAndVisible];

//    }

    
    // 多页 图
    
//    
//    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    
//    self.window = window;
//    
//    //判断是否需要显示：（内部已经考虑版本及本地版本缓存）
//    BOOL canShow = [XZMCoreNewFeatureVC canShowNewFeature];
//    
//    //测试代码，正式版本应该删除
//    canShow = YES;
//    
//    if(canShow){ // 初始化新特性界面
//        window.rootViewController = [XZMCoreNewFeatureVC newFeatureVCWithImageNames:@[@"主题"] enterBlock:^{
//            
////            NSLog(@"进入主页面");
//            [self enter];
//            
//        } configuration:^(UIButton *enterButton) { // 配置进入按钮
//            [enterButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
//            [enterButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateHighlighted];
//            enterButton.bounds = CGRectMake(0, 0, 120, 40);
//            enterButton.center = CGPointMake(KScreenW * 0.5, KScreenH* 0.85);
//        }];
//        
//    }else{
//        
//        [self enter];
//    }
    
//    [window makeKeyAndVisible];
    
    
    
    
    
//    
//    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    
//    self.window = window;
//    
//    //判断是否需要显示：（内部已经考虑版本及本地版本缓存）
//    BOOL canShow = [XZMCoreNewFeatureVC canShowNewFeature];
//    
//    //测试代码，正式版本应该删除
//    canShow = YES;
//    
//    if(canShow){ // 初始化新特性界面
//        window.rootViewController = [XZMCoreNewFeatureVC newFeatureVCWithPlayerURL:[[NSBundle mainBundle] URLForResource:@"qidong.mp4" withExtension:nil] enterBlock:^{
//            
//            NSLog(@"进入主页面");
//            [self enter];
//        } configuration:^(AVPlayerLayer *playerLayer) {
//            
//        }];
//        
//    }else{
//        
//        [self enter];
//    }
//    
//    [window makeKeyAndVisible];
    
    
    
        // Override point for customization after application launch.
    return YES;
}

// 进入主页面
-(void)enter{
    
    HYtabBarVC *vc = [[HYtabBarVC alloc] init];
    vc.view.backgroundColor = [UIColor brownColor];
    self.window.rootViewController = vc;
    [self.window.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:2.0f];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
