//
//  HYOneModel.h
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYOneModel : NSObject

@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *topic;
@property (nonatomic, copy) NSString *tagName;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *detailUrl;
@property (nonatomic, copy) NSString *viewCount;


- (instancetype)initWithDictionary:(NSDictionary *)dict;


@end
