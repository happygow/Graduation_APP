//
//  HYTwoCell.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/28.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYTwoCell.h"
@interface HYTwoCell()

@end
static int cellCount;
@implementation HYTwoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self ) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;  // 去掉选中效果
        //self.clipsToBounds = YES;
        
        CGFloat width = HYScreenWidth;
        
        
        // coverImage
        self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, HYValue(HYScreenHeight/ 1.9))];
        
        self.picture.image = [UIImage imageNamed:@"pic"];
        [self.contentView addSubview:self.picture];
        
        
        self.coverview = [[UIView alloc] initWithFrame:CGRectMake(0, self.picture.height - HYValue(150), HYScreenWidth, HYValue(150))];
        self.coverview.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        [self.contentView addSubview:self.coverview];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(HYValue(10), HYValue(10), HYScreenWidth - HYValue(20), HYValue(80))];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:23];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = 1; // 1是center
        self.titleLabel.text = @"测试 大标题   测试   测试测试测试";
        [self.coverview addSubview:self.titleLabel];
        
        self.sub_title = [[UILabel alloc] initWithFrame:CGRectMake(HYValue(10),self.titleLabel.bottom , HYScreenWidth - HYValue(20), HYValue(40))];
//        self.sub_title.backgroundColor = [UIColor yellowColor];
        self.sub_title.textColor = [UIColor whiteColor];
        self.sub_title.font = [UIFont systemFontOfSize:17];
        self.sub_title.numberOfLines = 0; // 自动换行
        self.sub_title.textAlignment = 1; // 1是center
        self.sub_title.text = @"subtitle tEST    subtit";
        
        [self.coverview addSubview:self.sub_title];

        
        
        cellCount++;
        
        HYLog(@"cellCount %d",cellCount);
        HYLog(@"celly== %f",self.y);

        
        
    }
    return self;
}



- (void)setModel:(HYTwoModel *)model
{
    
    _model = model;
    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.coverImageUrl]];
    self.titleLabel.text = model.mainTitle;
    self.sub_title.text = model.sub_title;
   
    HYLog(@"tittl;e == %@ subtitile == %@" , self.titleLabel.text,self.sub_title.text);
}



- (CGFloat)cellOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    CGFloat centerY = CGRectGetMidY(centerToWindow);
    CGPoint windowCenter = self.superview.center;
    
    CGFloat cellOffsetY = centerY - windowCenter.y;
    CGFloat offsetDig = cellOffsetY / self.superview.frame.size.height * 2;
    CGFloat offset = -offsetDig * (HYScreenHeight / 1.7 - 250) * 0.5;
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0, offset);
    self.picture.transform = transY;
    return offset;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
