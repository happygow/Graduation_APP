//
//  HYFourVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYFourVC.h"
#import "HYPhotoCollectionViewCell.h"
#import "HYPhotoModel.h"
@interface HYFourVC ()<UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>
{
    NSInteger pageCount;
}
// collectionView
@property (nonatomic , strong) UICollectionView *collectionView;
// 数组
@property (nonatomic , strong) NSMutableArray *dataArray;
@end
static NSString *ID = @"cell";
@implementation HYFourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"影像";
    
}


- (void)loadData
{
    //@{@"ClassifyMode":@1}   1  是 有图片  0  为 无图片
    [ HYNetworking getWithUrl:photoList refreshCache:YES params:@{@"ClassifyMode":@1} success:^(id response) {
        NSDictionary *dictionary = response[@"Result"][@"WorksInfo"];
       
       NSDictionary *photoDict = [dictionary objectForKey:@"ArticleInfoCollection"] ;
       HYLog(@"photodict----------%@",photoDict);
       for (NSDictionary *dict in photoDict) {
           HYPhotoModel *model = [[HYPhotoModel alloc] init];
           [_dataArray addObject:model];
           
           
           
           model.coverPic = [NSString stringWithFormat:@"%@",dict[@"PicAddress"]];
           model.picTitle = [NSString stringWithFormat:@"%@",dict[@"TextInfo"]];
           
       

           HYLog(@" title == %@",model.picTitle);
        HYLog(@" data count == %ld",_dataArray.count);
           
       }
    [_collectionView reloadData];
       
       
       
    } fail:^(NSError *error) {
        HYLog(@"出现错误");
    }];
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = [[HYPhotoCollectionViewCell alloc] init];
    }
    cell.model = _dataArray[indexPath.item];
//    cell.photoTitle.text = model.picTitle;
//    cell.contentText.text = model.contentText;
//    cell.tags.text = model.contentText;
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
