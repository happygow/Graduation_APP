//
//  HorzonItemCell.h
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
@interface HorzonItemCell : UICollectionViewCell
{
    UIImageView *_mCoverView;
    UIView      *_mDescView;
    UILabel     *_mDecLabel;
    UILabel     *_mTitleLabel;
}

- (void)isFristTypeCell:(NSString *)type;
- (void)isLastTypeCell;
- (void)isNormalCell:(BaseModel *)model;

- (UIColor *)randomColor;
@end
