//
//  CardLayout.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardLayoutDelegate <NSObject>

@end

@interface CardLayout : UICollectionViewLayout

@property(nonatomic, assign)CGFloat offsetY;
@property(nonatomic, assign)CGFloat contentSizeHeight;
@property(nonatomic, weak)id<CardLayoutDelegate> delegate;

-(instancetype)initWithOffsetY:(CGFloat)offsetY;


@end
