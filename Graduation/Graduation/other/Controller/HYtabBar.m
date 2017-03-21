//
//  HYtabBar.m
//  freelife
//
//  Created by sunnyday on 2016/10/15.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import "HYtabBar.h"

@implementation HYtabBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / 4;
    CGFloat buttonH = self.frame.size.height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]])continue ;
        // conunt x
        CGFloat buttonX = buttonW * index;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index ++;
    }
}

@end
