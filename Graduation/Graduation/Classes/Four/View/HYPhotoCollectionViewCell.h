//
//  HYPhotoCollectionViewCell.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYPhotoModel.h"
@interface HYPhotoCollectionViewCell : UICollectionViewCell

// model
@property (nonatomic , strong) HYPhotoModel *model;


// image
@property (nonatomic , strong) UIImageView *coverPic;

// title
@property (nonatomic , strong) UILabel *photoTitle;
// content
@property (nonatomic , strong) UILabel *contentText;
// tags
@property (nonatomic , strong) UILabel *tags;
// pic width
@property (nonatomic , assign) CGFloat picW;
// pic height
@property (nonatomic , assign) CGFloat picH;

// SharingUrl
@property (nonatomic , strong) NSString *SharingUrl;



@end
