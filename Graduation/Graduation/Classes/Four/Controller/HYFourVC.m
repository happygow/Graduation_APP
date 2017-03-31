//
//  HYFourVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYFourVC.h"
#import "HorizonScrollTableView.h"
#import "CategoryModel.h"
#import "CollectModel.h"
#import "DetailViewCtroller.h"

#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define AFTER(time, block)  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC), dispatch_get_main_queue(), block);

@interface HYFourVC ()<HorizontalTableViewDelegate>
{
    NSMutableArray *_dataSouce;
    HorizonScrollTableView *_horizonTableView;
}


@end
@implementation HYFourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jz_wantsNavigationBarVisible = YES;
    self.navigationItem.title = @"影像";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpHorizontalScrollView];
}



- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (NSMutableArray *)loadDataByType:(CenterTableViewType )type;
{
    
    NSArray *nameArray = @[@"办公",@"厨具",@"创意",@"护肤",@"家居",@"美食",@"数码",@"卫浴",@"运动",@"杂货",@"植物",@"主题"];
    
    NSMutableArray *colorArray = [NSMutableArray arrayWithCapacity:10];
    for (int i =0; i< 5; i++) {
        [colorArray addObject:[self randomColor]];
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    [nameArray enumerateObjectsUsingBlock:^(NSString *objname, NSUInteger idx, BOOL *stop) {
        CategoryModel *categoty = [[CategoryModel alloc] init];
        categoty.name = objname;
        
        NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0 ; i< 5; i++) {
            CollectModel *item = [[CollectModel alloc] init];
            item.title = [NSString stringWithFormat:@"%@--(%ld)",objname,i*idx];
//            if (type != CenterTableViewTopic) {
                item.price = [NSString stringWithFormat:@"￥%ld",(i+1)*(idx+1)*2];
//            }
            item.backgroundColor = colorArray[i];
            [itemArray addObject:item];
        }
        categoty.datalist = itemArray;
        [array addObject:categoty];
    }];
    return  array;
    
}
- (void)setUpHorizontalScrollView
{

    _horizonTableView = [[HorizonScrollTableView alloc] initWithFrame: CGRectMake(0, 0, HYScreenWidth, HYScreenHeight - 64)];
    _horizonTableView.delegate = self;
    [self.view addSubview:_horizonTableView];
     _horizonTableView.dataSource = [self loadDataByType:CenterTableViewTopic];
        _horizonTableView.type = CenterTableViewTopic;
    
}




#pragma mark -
#pragma mark - HorizontalTableViewDelegate
- (void)horizontalTableView:(CenterTableViewType)type didSelectItemAtContentIndexPath:(NSIndexPath *)contentIndexPath inTableViewIndexPath:(NSIndexPath *)tableViewIndexPath
{
//    if (contentIndexPath.row == 0 || contentIndexPath.row ==6 ) {
//        
//        if (type == CenterTableViewTopic)
//        {
//            // 跳转的主题列表
//            
//        }else
//        {
//            //跳转的主题单品列表
//        }
//    }else
//    {
        DetailViewCtroller *detailVC = [[DetailViewCtroller alloc] init];
        CategoryModel *model = _dataSouce[tableViewIndexPath.row];
        CollectModel *likeModel =  model.datalist[contentIndexPath.row];
        detailVC.title = likeModel.title;
        detailVC.view.backgroundColor = likeModel.backgroundColor;
        [self.navigationController pushViewController:detailVC animated:YES];
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
