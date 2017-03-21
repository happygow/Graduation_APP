//
//  HYTwoCell.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/28.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYTwoModel.h"
@interface HYTwoCell : UITableViewCell

@property (nonatomic, strong) UIImageView *picture;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *sub_title;

@property (nonatomic, strong) UIView *coverview;

- (CGFloat)cellOffset;

@property (nonatomic, strong) HYTwoModel *model;
@end
