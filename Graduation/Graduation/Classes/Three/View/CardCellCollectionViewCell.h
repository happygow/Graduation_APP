//
//  CardCellCollectionViewCell.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoListModel.h"

@interface CardCellCollectionViewCell : UICollectionViewCell    

@property (nonatomic, strong) UILabel *titleLabel;
/** 图片 */
@property (nonatomic, strong) UIImageView *coverImg;
// model
@property (nonatomic , strong) VideoListModel *model;

-(void)setBlur:(CGFloat)ratio; //设置毛玻璃效果

@end
