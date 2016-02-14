//
//  VCView.m
//  VTR
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 vanchu. All rights reserved.
//

#import "VCView.h"


#import "VCView.h"
//#import "AppDefinition.h"

@interface VCView()
@property (strong, nonatomic) CALayer *borderTop;
@property (strong, nonatomic) CALayer *borderRight;
@property (strong, nonatomic) CALayer *borderBottom;
@property (strong, nonatomic) CALayer *borderLeft;
@end

@implementation VCView

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.borderTop) {
        self.borderTop.frame = CGRectMake(0, 0, self.frame.size.width, self.borderTop.frame.size.height);
    }
    if (self.borderRight) {
        self.borderRight.frame = CGRectMake(self.frame.size.width - self.borderRight.frame.size.width, 0, self.borderRight.frame.size.width, self.frame.size.height);
    }
    if (self.borderBottom) {
        self.borderBottom.frame = CGRectMake(0, self.frame.size.height - self.borderBottom.frame.size.height, self.frame.size.width, self.borderBottom.frame.size.height);
    }
    if (self.borderLeft) {
        self.borderLeft.frame = CGRectMake(0, 0, self.borderLeft.frame.size.width, self.frame.size.height);
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth / [UIScreen mainScreen].scale;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderCornerRadius:(CGFloat)borderCornerRadius {
    self.layer.cornerRadius = borderCornerRadius;
}

- (void)setTopBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderTop) {
        [self.borderTop removeFromSuperlayer];
    }
    
    self.borderTop = [CALayer layer];
    self.borderTop.backgroundColor = color.CGColor;
    self.borderTop.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:self.borderTop];
}

- (void)setRightBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderRight) {
        [self.borderRight removeFromSuperlayer];
    }
    
    self.borderRight = [CALayer layer];
    self.borderRight.backgroundColor = color.CGColor;
    self.borderRight.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:self.borderRight];
}

- (void)setBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderBottom) {
        [self.borderBottom removeFromSuperlayer];
    }
    
    self.borderBottom = [CALayer layer];
    self.borderBottom.backgroundColor = color.CGColor;
    self.borderBottom.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:self.borderBottom];
}

- (void)setLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderLeft) {
        [self.borderLeft removeFromSuperlayer];
    }
    
    self.borderLeft = [CALayer layer];
    self.borderLeft.backgroundColor = color.CGColor;
    self.borderLeft.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:self.borderLeft];
}


@end
