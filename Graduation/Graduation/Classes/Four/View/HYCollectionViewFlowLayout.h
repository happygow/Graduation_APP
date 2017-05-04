//
//  HYCollectionViewFlowLayout.h
//  Graduation
//
//  Created by sunnyday on 2017/4/24.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HYCollectionViewFlowLayout;


@protocol UICollectionViewDelegateWaterFlowLayout <UICollectionViewDelegate>

- (CGFloat)collectionView:(UICollectionView *)collectionView
          waterFlowLayout:(HYCollectionViewFlowLayout *)layout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface HYCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSUInteger numberOfColumns;   //瀑布流的列数
@property (nonatomic, assign) CGSize itemSize1;              //每一个item的大小
@property (nonatomic, assign) UIEdgeInsets sectionInsets;   //分区的上、下、左、右、四个边距
@property (nonatomic, assign) CGFloat interitemSpacing;     //item的列间距(与行间距使用统一大小)
@property (nonatomic, assign) id<UICollectionViewDelegateWaterFlowLayout> delegate;



@end
