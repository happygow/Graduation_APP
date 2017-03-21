//
//  HYTwoVCTableViewController.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/28.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PictureView;
@interface HYTwoVCTableViewController : UITableViewController

@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) PictureView *pictureView;
@property (nonatomic, strong) NSArray *array;

@end
