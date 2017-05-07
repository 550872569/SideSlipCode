//
//  ViewController.m
//  SideSlipCode
//
//  Created by sogou-Yan on 17/5/7.
//  Copyright © 2017年 sogou. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    UIView *_viewSlide;
    UIButton *_buttonBg;
}
@end

static const CGFloat delay = 0.75;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSldeItem];
    [self initButtonBg];
    [self initSlideView];
}

- (void)initSldeItem {
    UIButton *buttonSlde = [[UIButton alloc]init];
    [buttonSlde setTitle:@"Slide" forState:UIControlStateNormal];
    [buttonSlde setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonSlde.titleLabel.font = [UIFont systemFontOfSize:20];
    [buttonSlde setBackgroundColor:[UIColor clearColor]];
    buttonSlde.frame = CGRectMake(0, 0, 60, 40);
    [buttonSlde addTarget:self action:@selector(_buttonSldeAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonSlde];
}

- (void)initButtonBg {
    _buttonBg = [[UIButton alloc]init];
    [_buttonBg addTarget:self action:@selector(_closeSlideAction:) forControlEvents:UIControlEventTouchUpInside];
    _buttonBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _buttonBg.backgroundColor = [UIColor darkGrayColor];
    [[UIApplication sharedApplication].keyWindow addSubview:_buttonBg];
    _buttonBg.hidden = YES;
}
- (void)_buttonSldeAction:(id)sender {
    [UIView animateWithDuration:delay animations:^{
        _buttonBg.hidden = NO;
        _viewSlide.frame = CGRectMake(0, 0, 0.8*SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
}

- (void)initSlideView {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    _viewSlide = [[UIView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH, 0, 0.8*SCREEN_WIDTH, SCREEN_HEIGHT)];
    [keyWindow addSubview:_viewSlide];
    _viewSlide.backgroundColor = [UIColor grayColor];
}

- (void)_closeSlideAction:(id)sender {
    [UIView animateWithDuration:delay animations:^{
        _viewSlide.frame = CGRectMake(-SCREEN_WIDTH, 0, 0.8*SCREEN_WIDTH, SCREEN_HEIGHT);
        _buttonBg.hidden = YES;
    }];
}

@end
