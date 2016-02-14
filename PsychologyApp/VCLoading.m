//
//  VCLoading.m
//  guimiquan
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 Vanchu. All rights reserved.
//

#import "VCLoading.h"
#import "Helper+Time.h"

@interface VCLoading(){
    UIWindow *_window;
}
@property (weak, nonatomic) IBOutlet UIView *wrapperView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UILabel *messageView;

@end

@implementation VCLoading

+ (VCLoading *)make:(NSString *)message {
	VCLoading *loading = [[[NSBundle mainBundle] loadNibNamed:@"VCLoading" owner:nil options:nil] objectAtIndex:0];
	loading.wrapperView.layer.cornerRadius = 4;
	loading.wrapperView.layer.masksToBounds = YES;
	loading.messageView.text = message;
	loading.translatesAutoresizingMaskIntoConstraints = NO;
	return loading;
}

- (void)show{
	_window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _window.windowLevel = UIWindowLevelAlert;
    
	[_window addSubview:self];
	[self.activityIndicatorView startAnimating];
	
	[_window addConstraint:[NSLayoutConstraint constraintWithItem:_window attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
	[_window addConstraint:[NSLayoutConstraint constraintWithItem:_window attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
	[_window addConstraint:[NSLayoutConstraint constraintWithItem:_window attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
	[_window addConstraint:[NSLayoutConstraint constraintWithItem:_window attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
	_window.hidden = NO;
    
    [Helper timeSetTimeout:30 withFinishBlock:^{
        if (_window) {
            _window.windowLevel = UIWindowLevelNormal;
            [self removeFromSuperview];
			_window.hidden = YES;
            _window = nil;
        }
    }];
}

- (void)showInFrame:(CGRect)frame autoHidden:(BOOL)hidden{
    self.frame = frame;
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.windowLevel = UIWindowLevelAlert;
    
    [_window addSubview:self];
    [self.activityIndicatorView startAnimating];
    [_window addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_window attribute:NSLayoutAttributeLeft multiplier:1.0 constant:frame.origin.x]];
    [_window addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_window attribute:NSLayoutAttributeTop multiplier:1.0 constant:frame.origin.y]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:frame.size.width]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:frame.size.height]];
    
    _window.hidden = NO;
    
    if (!hidden) {
        return;
    }
    [Helper timeSetTimeout:30 withFinishBlock:^{
        if (_window) {
            _window.windowLevel = UIWindowLevelNormal;
            [self removeFromSuperview];
            _window.hidden = YES;
            _window = nil;
        }
    }];
}

- (void)hide {
    [self removeFromSuperview];
    [_window resignKeyWindow];
    _window = nil;
}


@end
