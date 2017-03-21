//
//  HYLoadingView.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYLoadingView.h"

@interface HYLoadingView()

// uiimageview
@property (nonatomic , strong) UIImageView *loadingImageView;

@end

@implementation HYLoadingView

- (instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.loadingImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - HYValue(117)) / 2, (frame.size.height - HYValue(20)) / 2, HYValue(117), HYValue(20))];
        self.loadingImageView.image = [UIImage imageNamed:@"加载.gif"];
        [self addSubview:self.loadingImageView];
        
        if (color !=nil) {
            self.backgroundColor = color;
        }
    }
    return self;
}

@end
