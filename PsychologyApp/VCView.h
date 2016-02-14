//
//  VCView.h
//  VTR
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 vanchu. All rights reserved.
//


#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface VCView : UIView

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderCornerRadius;

- (void)setTopBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth;
- (void)setRightBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth;
- (void)setBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth;
- (void)setLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth;

@end

