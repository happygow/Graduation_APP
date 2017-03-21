//
//  UIButton+size.h
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (size)
+(CGSize)sizeOfLabelWithCustomMaxWidth:(CGFloat)width FontSize:(CGFloat)fontSize FilledTextString:(NSString *)str;
@end
