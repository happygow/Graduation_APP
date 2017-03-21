//
//  UIBarButtonItem+HYExtenssion.m
//  freelife
//
//  Created by LeeBruce on 16/10/21.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import "UIBarButtonItem+HYExtenssion.h"
#import "UIView+HYExtension.h"

@implementation UIBarButtonItem (HYExtenssion)


+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highIamge target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highIamge] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}


@end
