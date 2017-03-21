//
//  HYTwoModel.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/28.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYTwoModel.h"

@implementation HYTwoModel


- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.coverImageUrl = dict[@"image_url"];
        self.mainTitle = dict[@"title"];
        self.sub_title = dict[@"sub_title"];
        self.web_url = dict[@"web_view_url"];
        
    }
    return self;
}
@end
