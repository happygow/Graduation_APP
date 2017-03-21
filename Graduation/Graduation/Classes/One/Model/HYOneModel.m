//
//  HYOneModel.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYOneModel.h"

@implementation HYOneModel


- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self= [super init]) {
        self.topic = dict[@"topicName"];
        self.picUrl = dict[@"curiosityPicUrl"];
        self.viewCount = dict[@"viewerNum"];
        self.detailUrl = dict[@"marketingDesc"];
    }
    return self;
}
@end
