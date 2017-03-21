//
//  HYHeaderView.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.




//  这个视图包括  搜索按钮  消息按钮 搜索bar



#import "HYHeaderView.h"

@interface HYHeaderView()

// searchbar
@property (nonatomic , strong) UISearchBar *searchBar;
// buttn
@property (nonatomic , strong) UIButton *searchBtn;

@property (nonatomic , strong) UIButton *messageBtn;

@end

@implementation HYHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.searchBar];
        [self addSubview:self.searchBtn];
        [self addSubview:self.messageBtn];
    }
    return self;
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    for (UITableView *tableView in self.tabelviewArrays) {
        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        [tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    }
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    UITableView *tableview = (UITableView *)object;
    CGFloat tableViewOffsetY = tableview.contentOffset.y;
    
    UIColor *color = [UIColor whiteColor];
    CGFloat alpha = MIN(1, tableViewOffsetY / 136);
    self.backgroundColor = [color colorWithAlphaComponent:alpha];
    
    if (tableViewOffsetY < 125) {
        [UIView animateWithDuration:0.25 animations:^{
            self.searchBtn.hidden = NO;
            [self.messageBtn setBackgroundImage:[UIImage imageNamed:@"home_email_block"] forState:UIControlStateNormal];
            self.searchBar.frame = CGRectMake(-(self.width - HYValue(60)), HYValue(30), self.width - HYValue(80), HYValue(30));
            self.messageBtn.alpha = 1 - alpha;
            self.searchBar.alpha = 1 - alpha;
            
        }];
    }
    else if (tableViewOffsetY >= 125)
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.searchBar.frame = CGRectMake(HYValue(20), HYValue(30), self.width - HYValue(80), HYValue(30));
            self.messageBtn.alpha = 1;
            self.searchBtn.hidden = YES;
            
            [self.messageBtn setBackgroundImage:[UIImage imageNamed:@"home_email_black"] forState:UIControlStateNormal];
        }];
    }
    
    
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-(self.width-60), HYValue(28), self.width-HYValue(80), HYValue(30))];
        _searchBar.placeholder = @"点击搜索";
        _searchBar.layer.cornerRadius = HYValue(6);
        _searchBar.layer.masksToBounds = YES;
        
        [_searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:_searchBar.size] forState:UIControlStateNormal];
        
        [_searchBar setBackgroundImage:[UIImage imageWithColor:[[UIColor darkGrayColor] colorWithAlphaComponent:0.7] size:_searchBar.size] ];
        
        UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
        searchField.textColor = [UIColor whiteColor];
        [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

    }
    return _searchBar;
}

- (UIButton *)searchBtn
{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(HYValue(20), HYValue(20), HYValue(30), HYValue(30))];
        [_searchBtn setBackgroundImage:[UIImage imageNamed:@"home_search_icon"] forState:UIControlStateNormal];
        
    }
    return _searchBtn;
}


- (UIButton *)messageBtn
{
    if (!_messageBtn) {
        _messageBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width - HYValue(45), HYValue(30), HYValue(30), HYValue(30))];
        [_messageBtn setBackgroundImage:[UIImage imageNamed:@"home_email_block"] forState:UIControlStateNormal];
    }
    return _messageBtn;
    
}





@end
