//
//  UIView+HYExtension.h
//  freelife
//
//  Created by sunnyday on 2016/10/15.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HYExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;


// width
- (CGFloat)width;

// height
- (CGFloat)height;

// top
- (CGFloat)top;

// bottom
- (CGFloat)bottom;

// left
- (CGFloat)left;

// right
- (CGFloat)right;

- (CGSize)size;

// set width
- (void)setWidth:(CGFloat)width;

// set height
- (void)setHeight:(CGFloat)height;

- (void)setSize:(CGSize)size;

@end
