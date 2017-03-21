//
//  UIImage+HYImage.h
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HYImage)
/**
 根据颜色和尺寸生成图片
 
 @param color 颜色
 @param size 输出图片大小
 @return 图片大小
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
