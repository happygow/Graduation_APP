//
//  CardCellCollectionViewCell.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "CardCellCollectionViewCell.h"
#import <NSData+ImageContentType.h>

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
        self.coverImg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"videoHolder"]];
        [self.contentView addSubview:self.coverImg];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, HYValue(80), width, 30)];
 
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:HYValue(15)];
        self.titleLabel.textAlignment = 1; // 1是center

        [self.contentView addSubview:self.titleLabel];
        
        self.titleLabeld = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.bottom + HYValue(8), width, HYValue(20))];
        
        self.titleLabeld.textColor = [UIColor whiteColor];
        self.titleLabeld.font = [UIFont systemFontOfSize:HYValue(15)];
        self.titleLabeld.textAlignment = 1; // 1是center
        
        [self.contentView addSubview:self.titleLabeld];
        
        self.titleLabelt = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabeld.bottom + HYValue(8), width, 30)];
        
        self.titleLabelt.textColor = [UIColor whiteColor];
        self.titleLabelt.font = [UIFont systemFontOfSize:HYValue(15)];
        self.titleLabelt.textAlignment = 1; // 1是center
        
        [self.contentView addSubview:self.titleLabelt];

        
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
    
    
    // 日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.dates];
    formatter.dateFormat = @"yyyy年MM月dd日";
    NSString *timeStr = [formatter stringFromDate:date];

    //获取日期
    //NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    
//    CTGLog(@"123%ld",(long)week);
    NSString *strWeek = [self getweek:week];
//    CTGLog(@"1230%@",strWeek);
    // 加上这句 会出问题
    //self.weekstr1.text=[NSString stringWithFormat:@"%@",[arrWeek objectAtIndex:week]];
    
    //CTGLog(@"11111111111%@",self.weekstr1.text);
    
    
//    self.titleLabelt.text = [NSString stringWithFormat:@"%@ %@ %@-%@",timeStr,strWeek,model.classes_start_time,model.classes_end_time];
    
    self.titleLabeld.text = [NSString stringWithFormat:@"%@",timeStr];
    
}


- (NSString*)getweek:(NSInteger)week
{
    NSString *weekStr=nil;
    if(week==1)
    {
        weekStr=@"星期天";
    }else if(week==2){
        weekStr=@"星期一";
        
    }else if(week==3){
        weekStr=@"星期二";
        
    }else if(week==4){
        weekStr=@"星期三";
        
    }else if(week==5){
        weekStr=@"星期四";
        
    }else if(week==6){
        weekStr=@"星期五";
        
    }else if(week==7){
        weekStr=@"星期六";
        
    }
    return weekStr;
}

@end
