//
//  HYoneCell.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYoneCell.h"
@interface HYoneCell()

@end
@implementation HYoneCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.topicimageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.viewCount];

        
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
    
    [_viewCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(_topicimageView.mas_bottom).offset(40);
    }];
//

    
    
}
- (void)setModel:(HYOneModel *)model
{
    _model = model;
    HYLog(@"pic url ==== %@%@%@",model.picUrl,model.topic,model.viewCount);
    [self.topicimageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
    self.titleLabel.text = model.topic;
    self.viewCount.text = [NSString stringWithFormat:@"浏览量:%@",self.model.viewCount];

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
    if (!_viewCount) {
        _viewCount = [[UILabel alloc] init];
        _viewCount.textColor = [UIColor grayColor];
        _viewCount.font = [UIFont systemFontOfSize:11];
//        _viewCount.text = @"12121212";
    }
    return _viewCount;
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
