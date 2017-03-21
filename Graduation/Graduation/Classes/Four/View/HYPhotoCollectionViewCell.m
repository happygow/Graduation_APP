//
//  HYPhotoCollectionViewCell.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYPhotoCollectionViewCell.h"

@interface HYPhotoCollectionViewCell()


@end


@implementation HYPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        //CGFloat height = frame.size.height;
        
        
        // pic 图片的大小为：picW = (screenW - 10/picW )* picW
        // pic h   picH = (screenW - 10/picW )* picH
        
        self.coverPic = [[UIImageView alloc] initWithFrame:CGRectMake(HYValue(5), HYValue(5), width - HYValue(10), (HYScreenWidth - HYValue(10)/self.picW) * _picH)];
        self.coverPic.backgroundColor = [UIColor redColor];
        self.coverPic.layer.cornerRadius = HYValue(5);
        self.coverPic.layer.masksToBounds = YES;
        [self.contentView addSubview:self.coverPic];
        
        
        // title
        self.photoTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.coverPic.x, self.coverPic.bottom + HYValue(10), width, HYValue(20))];
        self.photoTitle.text = @"啦啦啦啦啦啦啦啦啦";
        self.photoTitle.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.photoTitle];
        
        // content
        self.contentText = [[UILabel alloc] initWithFrame:CGRectMake(self.coverPic.x, self.photoTitle.bottom + HYValue(10), self.photoTitle.width, HYValue(100))];
        self.contentText.text = @"见到了死扩句绿所扩军绿所多军绿所扩军多绿所多军绿所多军绿所多军绿所多军绿所扩扩扩扩扩扩扩扩扩扩绿绿绿绿绿绿绿绿绿绿绿绿绿绿开始看扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩多多多多多多多多多多多多多多多多军军军军军军军军";
        self.contentText.font = [UIFont systemFontOfSize:14];
        self.contentText.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.contentText];
        
    }
    return self;
}

- (void)setModel:(HYPhotoModel *)model
{
    _model = model;
    [self.coverPic sd_setImageWithURL:[NSURL URLWithString:model.coverPic] placeholderImage:[UIImage imageNamed:@"1"]];
    self.photoTitle.text = model.picTitle;
    self.contentText.text = model.contentText;
    self.tags.text = model.tags;
}


@end
