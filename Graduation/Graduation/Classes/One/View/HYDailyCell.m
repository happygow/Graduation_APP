
//
//  HYDailyCell.m
//  Graduation
//
//  Created by LeeBruce on 17/3/31.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYDailyCell.h"

@implementation HYDailyCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.topicimageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.likeCount];
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_topicimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(220);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
    }];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(_topicimageView.mas_bottom).offset(20);
    }];
    
    [_likeCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(_topicimageView.mas_bottom).offset(40);
    }];
    //
    
    
    
}
- (void)setModel:(HYDailyModel *)model
{
    _model = model;
//    HYLog(@"pic url ==== %@%@%@",model.picUrl,model.topic,model.viewCount);
    [self.topicimageView sd_setImageWithURL:[NSURL URLWithString:model.images[0]]];
    self.titleLabel.text = model.topic;
    self.likeCount.text = [NSString stringWithFormat:@"浏览量:%@",model.likenum];
    
}






#pragma mark - Lazy Load

- (UIImageView *)topicimageView {
    if (!_topicimageView) {
        _topicimageView = [[UIImageView alloc] init];
        _topicimageView.image = [UIImage imageNamed:@"recomand_01.jpg"];
    }
    return _topicimageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"测试主题";
    }
    return _titleLabel;
}


//
- (UILabel *)viewCount {
    if (!_likeCount) {
        _likeCount = [[UILabel alloc] init];
        _likeCount.textColor = [UIColor grayColor];
        _likeCount.font = [UIFont systemFontOfSize:11];
        //        _viewCount.text = @"12121212";
    }
    return _likeCount;
}




@end
