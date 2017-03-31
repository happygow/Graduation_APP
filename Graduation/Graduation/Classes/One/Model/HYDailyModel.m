//
//  HYDailyModel.m
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYDailyModel.h"

@implementation HYDailyModel
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self= [super init]) {
        self.topic = dict[@"name"];
//        self.picUrl = dict[@"curiosityPicUrl"];
        self.likenum = dict[@"like_user_num"];
        self.publish_at = dict[@"publish_at"];
        self.images = dict[@"images"];
    }
    return self;
}
@end
