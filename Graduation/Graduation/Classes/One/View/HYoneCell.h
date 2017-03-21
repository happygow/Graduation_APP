//
//  HYoneCell.h
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYOneModel.h"
@interface HYoneCell : UITableViewCell


@property (nonatomic, strong) UIImageView *topicimageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *tagNmae;
@property (nonatomic, strong) UILabel *viewCount;//浏览量

@property (nonatomic, strong) HYOneModel *model;
@end
