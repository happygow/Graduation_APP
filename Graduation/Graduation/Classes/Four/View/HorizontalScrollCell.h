//
//  HorizontalScrollCell.h
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "HorizontalScrollCellDeleagte.h"

@interface HorizontalScrollCell : BaseTableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>
{
    
}
@property(nonatomic ,strong)UICollectionView *collectionView;

@property (weak, nonatomic) id <HorizontalScrollCellDeleagte> delegate;

///**
// Control the Collection View of all Content Cells in each horizontally scrolled row
// */
//@property (strong, nonatomic) UICollectionView *horizontalScrollContentsView;
//
///**
// Set the content cell Class Name
// */
//@property (weak, nonatomic) NSString *contentCellClass;
//
///**
// Tell the size of Content Cell frame.
// Read-only property.
// */
//@property (nonatomic, readonly) CGSize contentCellSize;
//
///**
// Store the table-view index path where each ASOXScrollTableViewCell object is attached to.
// */
@property (strong, nonatomic) NSIndexPath *tableViewIndexPath;


- (void)reloadData;

@end
