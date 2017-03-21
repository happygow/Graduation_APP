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

        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_topicimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
    }];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(_topicimageView.mas_bottom).offset(20);
    }];
    

    
    
}
- (void)setModel:(HYOneModel *)model
{
    _model = model;
    HYLog(@"pic url ==== %@%@%@",model.picUrl,model.topic,model.viewCount);
    [self.topicimageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
    self.titleLabel.text = model.topic;
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



- (UILabel *)tagNmae {
    if (!_tagNmae) {
        _tagNmae = [[UILabel alloc] init];
        _tagNmae.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _tagNmae.font = [UIFont systemFontOfSize:11];
        _tagNmae.text = @"小糖君";
    }
    return _tagNmae;
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
