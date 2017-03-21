//
//  HYTime.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/14.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYTime.h"

@implementation HYTime
+ (NSString *)timeStrFormTime:(NSString *)timeStr
{
    int time = [timeStr intValue];
    int minutes = time / 60;
    int second = (int)time % 60;
    return [NSString stringWithFormat:@"%02d'%02d\"",minutes,second];
}
@end
