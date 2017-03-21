//
//  HYVideoPlayVC.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/14.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYVideoPlayVC : UIViewController
// 视频地址
@property(nonatomic,strong) NSString *UrlString;
// 视频标题
@property(nonatomic,strong) NSString *titleStr;
// 视频时长
@property(nonatomic, assign) double duration;

@end
