//
//  HYFailView.m
//  Graduation
//
//  Created by LeeBruce on 17/3/22.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYFailureView.h"

static CGFloat const imageWidth = 396 / 2.5;
static CGFloat const imageHeight = 332 / 2.5;


@interface HYFailureView()
@property (nonatomic, strong) UIImageView *failImageView;

@end
@implementation HYFailureView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _failImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - imageWidth) / 2, (frame.size.height - imageHeight) / 2, imageWidth, imageHeight)];
        _failImageView.image = [UIImage imageNamed:@"jiazaishibai"];
        [self addSubview:_failImageView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _failImageView.frame = CGRectMake((frame.size.width - imageWidth) / 2, (frame.size.height - imageHeight) / 2, imageWidth, imageHeight);
}
@end
