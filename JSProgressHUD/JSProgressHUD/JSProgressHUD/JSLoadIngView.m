//
//  JSLoadIngView.m
//  JSProgressHUD
//
//  Created by ShenYj on 2017/5/27.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import "JSLoadIngView.h"

@interface JSLoadIngView ()

/** LOGO图片 : 不动 */
@property (nonatomic,strong) UIImageView *loadingLogoImageView;
/** LOGO外围圆环: 旋转 */
@property (nonatomic,strong) UIImageView *loadingRotationImageView;
/** 文本提示 */
@property (nonatomic,strong) UILabel     *contentLabel;

@end

@implementation JSLoadIngView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpLoadingView];
    }
    return self;
}

- (void)setUpLoadingView
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.loadingRotationImageView];
    [self addSubview:self.loadingLogoImageView];
    [self addSubview:self.contentLabel];
    
    [self.loadingRotationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [self.loadingLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loadingRotationImageView.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self);
    }];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = CGFLOAT_MAX;
    [self.loadingRotationImageView.layer addAnimation:anima forKey:nil];
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)loadingLogoImageView {
    if (!_loadingLogoImageView) {
        _loadingLogoImageView = [[UIImageView alloc] init];
        _loadingLogoImageView.image = [UIImage imageNamed:@"ic_loading_logo"];
    }
    return _loadingLogoImageView;
}
- (UIImageView *)loadingRotationImageView {
    if (!_loadingRotationImageView) {
        _loadingRotationImageView = [[UIImageView alloc] init];
        _loadingRotationImageView.image = [UIImage imageNamed:@"real_short_btn2"];
    }
    return _loadingRotationImageView;
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.text = @"正在加载中...";
    }
    return _contentLabel;
}


@end
