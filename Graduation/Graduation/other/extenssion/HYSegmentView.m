//
//  HYSegmentView.m
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYSegmentView.h"


@interface HYSegmentView()

@property (nonatomic, strong) NSString *titleNormalColor;

@property (nonatomic, strong) NSString *titleClickColor;

@property (nonatomic, strong) UIView *sliderView;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, strong) NSMutableArray *btns;

@end




@implementation HYSegmentView
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleNormalColor:(UIColor *)titleNormalColor titleClickColor:(UIColor *)titleClickColor titleFont:(CGFloat)titleFont
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _btns = [NSMutableArray array];
        self.backgroundColor = [UIColor yellowColor];
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        CGFloat viewWidth = width / titles.count;
        self.width = viewWidth;
        for (int i = 0; i < titles.count; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(viewWidth * i, 0, viewWidth, height - HYValue(3));
//            btn.backgroundColor = backgroundColor;
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            btn.titleLabel.font = kFont(titleFont);
            [btn setTitleColor:titleNormalColor forState:UIControlStateNormal];
            [btn setTitleColor:titleClickColor forState:UIControlStateSelected];
            btn.tag = 1000 + i;
            [btn addTarget:self action:@selector(segmentIndexSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [_btns addObject:btn];
            if (i == 0)
            {
                _sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, btn.bottom, viewWidth, HYValue(2))];
                _sliderView.backgroundColor = titleClickColor;
                [self addSubview:_sliderView];
                btn.selected = YES;
            }
            
        }
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, height - HYValue(1), width, HYValue(1))];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
    }
    return self;
}

- (void)segmentIndexSelected:(UIButton *)btn
{
    for (UIButton *button in self.btns)
    {
        button.selected = NO;
    }
    btn.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        _sliderView.frame = CGRectMake(btn.x, btn.bottom, btn.width, HYValue(2));
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickWithIndex:)])
    {
        [self.delegate didClickWithIndex:btn.tag - 1000];
    }
}

- (void)changeSegmentWithIndex:(NSInteger)index
{
    UIButton *btn = self.btns[index];
    for (UIButton *button in self.btns)
    {
        button.selected = NO;
    }
    btn.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        _sliderView.frame = CGRectMake(btn.x, btn.bottom, btn.width, HYValue(2));
    }];
}

@end
