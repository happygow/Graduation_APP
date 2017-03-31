//
//  HYDailyCell.h
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYDailyModel.h"
@interface HYDailyCell : UITableViewCell
@property (nonatomic, strong) UIImageView *topicimageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *likeCount;//浏览量
@property (nonatomic, strong) HYDailyModel *model;
@end
