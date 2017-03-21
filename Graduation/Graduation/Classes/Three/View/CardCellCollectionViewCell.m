//
//  CardCellCollectionViewCell.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "CardCellCollectionViewCell.h"

@interface CardCellCollectionViewCell()

@end

static int cellCount;

@implementation CardCellCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
       
        
        
        // coverImage
        self.coverImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.coverImg.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.coverImg];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, width, 30)];
 
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = 1; // 1是center

        [self.contentView addSubview:self.titleLabel];

        
        cellCount++;
        
        HYLog(@"cellCount %d",cellCount);
        HYLog(@"celly== %f",self.y);
    }
    return self;
}

//-(void)layoutSubviews
//{
//    self.contentView.frame = self.bounds;
//    self.titleLabel.center = CGPointMake(self.bounds.size.width/2.0, 2 + self.titleLabel.frame.size.height/2.0);
//    //self.imageView.frame = self.bounds;
//    self.blurView.frame = self.bounds;
//}



- (void)setModel:(VideoListModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.videoTitle;
    [self.titleLabel sizeToFit];
    [self setNeedsLayout];
    [self.coverImg sd_setImageWithURL:[NSURL URLWithString:model.ImageView]];
    
    
}


@end
