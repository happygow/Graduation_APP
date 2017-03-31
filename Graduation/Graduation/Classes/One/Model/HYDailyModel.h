//
//  HYDailyModel.h
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYDailyModel : NSObject
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, copy) NSString *topic;
@property (nonatomic, copy) NSString *likenum;
@property (nonatomic, copy) NSString *publish_at;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
