//
//  VCButton.m
//  VTR
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 vanchu. All rights reserved.
//

#import "VCButton.h"


@implementation VCButton

- (void)drawRect:(CGRect)rect {
    /*
     UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.cornerRadius];
     path.lineWidth = self.borderWidth;
     
     [path fill];
     [path stroke];
     */
}


- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
    if(self.layer.borderWidth ==0)
        self.layer.borderWidth = 1.0f;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void) setBackgroundImageWithColor:(UIColor *)color forState:(UIControlState)state{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:theImage forState:state];
}

- (void)setBackgroundNormalColor:(UIColor *)backgroundNormalColor
{
    _backgroundNormalColor = backgroundNormalColor;
    [self setBackgroundImageWithColor:backgroundNormalColor forState:UIControlStateNormal];
}

- (void)setBackgroundHighlightedColor:(UIColor *)backgroundHighlightedColor
{
    _backgroundHighlightedColor = backgroundHighlightedColor;
    [self setBackgroundImageWithColor:backgroundHighlightedColor forState:UIControlStateHighlighted];
}

- (void)setBackgroundSelectedColor:(UIColor *)backgroundSelectedColor
{
    _backgroundSelectedColor = backgroundSelectedColor;
    [self setBackgroundImageWithColor:backgroundSelectedColor forState:UIControlStateSelected];
}
- (void)setBackgroundDisabledColor:(UIColor *)backgroundDisabledColor
{
    _backgroundDisabledColor = backgroundDisabledColor;
    [self setBackgroundImageWithColor:backgroundDisabledColor forState:UIControlStateDisabled];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    if(cornerRadius>0)
    {
        self.layer.masksToBounds = YES;
    }
}

@end