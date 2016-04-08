//
//  LoadOnAnimateView.m
//  guimiquan
//
//  Created by emaly on 15/3/31.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import "LoadOnAnimateView.h"
#import "UIView+FrameMethods.h"
#import "UIColor+Helper.h"
#import "UIView+Helper.h"

@interface LoadOnAnimateView ()
{
    UIImageView *_animationView;
}
@end

@implementation LoadOnAnimateView

- (void)dealloc {
    [self stopAnimating];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        if (!_animationView) {
            _animationView = [[UIImageView alloc] initWithFrame:self.bounds];
            
            if (self.width > 25 || self.height > 25) {
                _animationView.animationImages = @[[UIImage imageNamed:@"icon_common_spinning_large_0"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_1"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_2"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_3"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_4"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_5"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_6"]];
            }
            else {
                _animationView.animationImages = @[[UIImage imageNamed:@"icon_common_spinning_small_0"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_1"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_2"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_3"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_4"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_5"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_6"]];
            }
            
            _animationView.animationDuration = 1.0f;
            _animationView.animationRepeatCount = 0;
            [self addSubview:_animationView];
        }
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        if (!_animationView) {
            _animationView = [[UIImageView alloc] initWithFrame:self.bounds];
            
            if (self.width > 25 || self.height > 25) {
                _animationView.animationImages = @[[UIImage imageNamed:@"icon_common_spinning_large_0"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_1"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_2"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_3"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_4"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_5"],
                                                   [UIImage imageNamed:@"icon_common_spinning_large_6"]];
            }
            else {
                _animationView.animationImages = @[[UIImage imageNamed:@"icon_common_spinning_small_0"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_1"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_2"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_3"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_4"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_5"],
                                                   [UIImage imageNamed:@"icon_common_spinning_small_6"]];
            }
            
            _animationView.animationDuration = 1.0f;
            _animationView.animationRepeatCount = 0;
            [self addSubview:_animationView];
        }
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_animationView startAnimating];
}

#pragma mark - Public Functions

- (void)startAnimating {
    [_animationView startAnimating];
}

- (void)stopAnimating {
     [_animationView stopAnimating];
}

@end
