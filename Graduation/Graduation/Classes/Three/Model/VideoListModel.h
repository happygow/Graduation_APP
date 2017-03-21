//
//  VideoListModel.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoListModel : NSObject
/** 图片 */
@property (nonatomic, copy) NSString *ImageView;

@property (nonatomic, copy) NSString *alphaCoverImg;

/** 标题 */
@property (nonatomic, copy) NSString *videoTitle;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *videoDescription;

@property (nonatomic, copy) NSDictionary *consumption;

@property (nonatomic, copy) NSString *playUrl;

@property (nonatomic, copy) NSString *actionUrl;

@property (nonatomic, copy) NSString *idStr;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
