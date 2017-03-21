//
//  CardSelectedLayout.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardSelectedLayout : UICollectionViewLayout

-(instancetype)initWithIndexPath:(NSIndexPath*)indexPath offsetY:(CGFloat)offsetY ContentSizeHeight:(CGFloat)sizeHeight;

@property(nonatomic, assign)NSIndexPath* selectedIndexPath;
@property(nonatomic, assign)CGFloat contentOffsetY;
@property(nonatomic, assign)CGFloat contentSizeHeight;

@end
