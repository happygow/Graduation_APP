//
//  HYPhotoVC.m
//  Graduation
//
//  Created by sunnyday on 2017/4/24.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYPhotoVC.h"
#import "HYCollectionViewFlowLayout.h"

@interface HYPhotoVC ()<UICollectionViewDelegateWaterFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>



@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation HYPhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];

    HYCollectionViewFlowLayout *layout = [[HYCollectionViewFlowLayout alloc] init];
    layout.itemSize1 = CGSizeMake((HYScreenWidth - 30)/2, 0);
    layout.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.numberOfColumns = 2;
    layout.interitemSpacing = 10;
    layout.delegate = self;
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYScreenHeight - 64) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = HYWhiteColor;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
