//
//  HYImageCollectionViewCell.m
//  Graduation
//
//  Created by sunnyday on 2017/4/24.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYImageCollectionViewCell.h"

@interface HYImageCollectionViewCell()


@property (nonatomic, strong) UIImageView *commendImage;

@end

@implementation HYImageCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self ) {
        self.commendImage = [[UIImageView alloc] init];
        self.commendImage.image = [UIImage imageNamed:@"mainHolder"];
        self.commendImage.frame = CGRectMake(0, 0, self.commendImage.image.size.width, self.commendImage.image.size.height);
        [self.contentView addSubview:self.commendImage];
    }
    return self;
   
    
}


@end
