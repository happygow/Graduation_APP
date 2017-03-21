//
//  UIBarButtonItem+HYExtenssion.h
//  freelife
//
//  Created by LeeBruce on 16/10/21.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HYExtenssion)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highIamge target:(id)target action:(SEL)action;

/**
 *  通过字体来设置button的frame
 *
 *  @param width    宽
 *  @param fontSize 字体大小
 *  @param str      title
 *
 */
+(CGSize)sizeOfLabelWithCustomMaxWidth:(CGFloat)width FontSize:(CGFloat)fontSize FilledTextString:(NSString *)str;



@end
