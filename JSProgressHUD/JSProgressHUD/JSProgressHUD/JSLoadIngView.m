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
    self.backgroundColor = [UIColor js_randomColor];
    [self addSubview:self.loadingRotationImageView];
    [self addSubview:self.loadingLogoImageView];
    
    [self.loadingRotationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.mas_equalTo(self);
    }];
    [self.loadingLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
    }];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = 10;
    [self.loadingRotationImageView.layer addAnimation:anima forKey:nil];
}

#pragma mark
#pragma mark - lazy

- (UIImageView *)loadingLogoImageView {
    if (!_loadingLogoImageView) {
        _loadingLogoImageView = [[UIImageView alloc] init];
        _loadingLogoImageView.image = [UIImage imageNamed:@"loading"];
    }
    return _loadingLogoImageView;
}
- (UIImageView *)loadingRotationImageView {
    if (!_loadingRotationImageView) {
        _loadingRotationImageView = [[UIImageView alloc] init];
        _loadingRotationImageView.image = [UIImage imageNamed:@"catch_loading"];
    }
    return _loadingRotationImageView;
}


@end
