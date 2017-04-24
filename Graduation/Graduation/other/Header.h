//
//  Header.h
//  freelife
//
//  Created by LeeBruce on 16/10/24.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#ifndef Header_h
#define Header_h


#ifdef DEBUG
#define HYLog(...)    NSLog(__VA_ARGS__)
#else
#define HYLog(...)
#endif

#define HYScreenWidth [[UIScreen mainScreen] bounds].size.width

#define HYScreenHeight [[UIScreen mainScreen] bounds].size.height
#define weakify(var)   __weak typeof(var) weakSelf = var
// 屏幕适配，以 6 为参照
#define HYValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

#define HYUIColor(color) [UIColor colorWithHexString:color]
// 全局输入的字体颜色
#define kUIColor(color) [UIColor colorWithHexString:color]

// 主色调 ff5d73   255 93 115

#define HYMainColor HYrgb(255,84,108)

#define HYSearchColor HYrgb(255,178,188)
// 255  243  158
#define HYCoverColor HYrgb(34,94,155)
// 106  184 186
#define HYCoverAlpha HYrgb(34,94,155)

// 蓝深色
#define HYBlueDeep HYrgb(29,68,93)
#define HYAlphaColor(r,g,b,c) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(c)1.0f]
//#define HYCoverAlphaColor HYAlphaColor(106,184,186,0.4)

/**
 *  白色字体颜色
 */
#define HYWhiteColor [UIColor whiteColor]
// RGB
#define HYrgb(r,g,b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

#define fontMax HYValue (15.0)
#define fontMin HYValue (14.0)
#define spacing HYValue (15.0)
// 字体
#define kFont(x)    [UIFont systemFontOfSize:(x)]
/** 滚动标题的高度  */
static const CGFloat HYTitleVewHeight = 40;
/** 滚动标题每个item的宽度  */
static const CGFloat HYTitleViewItemWidth = 64;


// url
#define dailyList @"http://baobab.wandoujia.com/api/v1/feed.bak?num=%ld&date=%@"
#define photoList @"http://api.mobile.9panart.com/works/91e39a0d-1ced-4433-ba43-a4edd2e97c9c"
// 创意URL
#define idealList @"http://baobab.kaiyanapp.com/api/v1/videos.bak?strategy=date&categoryName=%E5%88%9B%E6%84%8F&num=10"
//  画报URL
#define huabaoUrl @"http://design.zuimeia.com/api/v2/articles/daily/simple/"
// 时尚 URL
#define fashionURL @"http://www.yuntoo.com/v2/home/channel/5/refresh?client_type=1&client_version=2.9.0&build_version=100605&uuid=0643C6F1-EEE4-411F-AE70-1B7EFA908F94&session_key=2729c9dd6e5de09ac3c44e3d9ee2bc96ab837b5ccd2de1642e65fc579e3df610&req_time=1489717940&offset=0&limit=10"

// 艺术
#define artUrl @"http://api.artgoer.cn:8084/artgoer/api/v1/user/0/v3/topic/topicList?pageIndex=1&token=df68e038-143e-41cb-b554-456f78f184fc&topicLabelId=1"
// 设计
#define designURL @"http://api.artgoer.cn:8084/artgoer/api/v1/user/0/v3/topic/topicList?pageIndex=1&token=df68e038-143e-41cb-b554-456f78f184fc&topicLabelId=2"
// 摄影
#define photoURL @"http://api.artgoer.cn:8084/artgoer/api/v1/user/0/v3/topic/topicList?pageIndex=1&token=df68e038-143e-41cb-b554-456f78f184fc&topicLabelId=3"
#define lifeURL @"http://api.artgoer.cn:8084/artgoer/api/v1/user/0/v3/topic/topicList?pageIndex=1&token=df68e038-143e-41cb-b554-456f78f184fc&topicLabelId=4"

#define dailyURL @"http://design.zuimeia.com/api/v1/products/daily"

#define allArtURL @"http://design.zuimeia.com/api/v1/products/category/70"
#define RingURL @"http://design.zuimeia.com/api/v1/products/category/3"
#define PackageURL @"http://design.zuimeia.com/api/v1/products/category/1"
#define ShoesURL @"http://design.zuimeia.com/api/v1/products/category/2"
#define ManURL @"http://design.zuimeia.com/api/v1/products/category/65"

#endif /* Header_h */
