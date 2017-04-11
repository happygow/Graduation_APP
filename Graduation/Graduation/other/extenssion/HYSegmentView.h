//
//  HYSegmentView.h
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HYHeaderSegmentViewDelegate <NSObject>

- (void)didClickWithIndex:(NSInteger)index;

@end



@interface HYSegmentView : UIView



- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleNormalColor:(UIColor *)titleNormalColor titleClickColor:(UIColor *)titleClickColor titleFont:(CGFloat)titleFont;


@property (nonatomic, assign) id<HYHeaderSegmentViewDelegate> delegate;

- (void)changeSegmentWithIndex:(NSInteger)index;
@end
