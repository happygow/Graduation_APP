//
//  HorizonScrollTableView.h
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalScrollCell.h"
#import "HorizontalScrollCellDeleagte.h"

typedef NS_ENUM(NSUInteger, CenterTableViewType) {
    CenterTableViewTopic,
    CenterTableViewGoods,
};

@protocol HorizontalTableViewDelegate <NSObject>

- (void)horizontalTableView:(CenterTableViewType)type didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath;

@end

@interface HorizonScrollTableView : UIView<UITableViewDataSource,UITableViewDelegate,HorizontalScrollCellDeleagte>
{
    
}
- (instancetype)initWithFrame:(CGRect)frame withType:(CenterTableViewType )type;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) CenterTableViewType type;

@property (nonatomic, weak) id<HorizontalTableViewDelegate> delegate;

@end

