//
//  HYPhotoModel.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYPhotoModel.h"

@implementation HYPhotoModel
- (instancetype)initWithDict:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        self.coverPic = dic[@"PicAddress"];
        self.picTitle = dic[@"TextInfo"];
        self.contentText = dic[@"TextInfo"];
        self.tags = dic[@"Tags"];
        self.picW = dic[@"PicRatioWidth"];
        self.picH = dic[@"PicRatioHeight"];
        self.WorksId = dic[@"WorksId"];
        self.SharingUrl = dic[@"SharingUrl"];
        
    }
    return self;
}
@end
