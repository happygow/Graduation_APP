//
//  HYSchoolMore.h
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYSchoolMoreDelegate <NSObject>

- (void)selectedWithIndex:(NSInteger)index;

@end



@interface HYSchoolMore : UIView
- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, assign) id<HYSchoolMoreDelegate> delegate;
@end
