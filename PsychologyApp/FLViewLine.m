//
//  GMViewLine.m
//  guimiquan
//  Created by felix on 16/1/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "FLViewLine.h"
#import "AppDefinition.h"

@interface FLViewLine()
@property (strong, nonatomic) CALayer *borderTop;
@property (strong, nonatomic) CALayer *borderRight;
@property (strong, nonatomic) CALayer *borderBottom;
@property (strong, nonatomic) CALayer *borderLeft;
@end

@implementation FLViewLine

/*
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    [self.layer removeFromSuperlayer];
    
    if(self.lineTop)
    {
        [self setTopBorderWithColor:self.lineColor andWidth:self.lineWidth];
    }
    else if(self.borderTop){
        [self.borderTop removeFromSuperlayer];
    }
    
    if(self.lineLeft)
    {
        [self setLeftBorderWithColor:self.lineColor andWidth:self.lineWidth];
    }
    else if(self.borderLeft){
        [self.borderLeft removeFromSuperlayer];
    }
    
    if(self.lineBottom)
    {
        [self setBottomBorderWithColor:self.lineColor andWidth:self.lineWidth];
    }
    else if(self.borderBottom){
        [self.borderBottom removeFromSuperlayer];
    }
    
    if(self.lineRight)
    {
        [self setRightBorderWithColor:self.lineColor andWidth:self.lineWidth];
    }
    else if(self.borderRight){
        [self.borderRight removeFromSuperlayer];
    }
    
}


- (void)setLineTop:(BOOL)lineTop{
    _lineTop = lineTop;
    [self setNeedsDisplay];
}

- (void)setLineBottom:(BOOL)lineBottom{
    _lineBottom = lineBottom;
    [self setNeedsDisplay];
}

- (void)setLineLeft:(BOOL)lineLeft{
    _lineLeft = lineLeft;
    [self setNeedsDisplay];
}

- (void)setLineRight:(BOOL)lineRight{
    _lineRight = lineRight;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setFilament:(BOOL)filament
{
    _filament = filament;
    [self setNeedsDisplay];
}


- (void)setTopBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderTop) {
        [self.borderTop removeFromSuperlayer];
    }
    borderWidth = [FLViewLine lineWidthWith:borderWidth WithFilament:self.filament];
    self.borderTop = [FLViewLine CreateLineWithColor:color andWidth:borderWidth];
    self.borderTop.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:self.borderTop];
}

- (void)setRightBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderRight) {
        [self.borderRight removeFromSuperlayer];
    }
    borderWidth = [FLViewLine lineWidthWith:borderWidth WithFilament:self.filament];
    self.borderRight = [FLViewLine CreateLineWithColor:color andWidth:borderWidth];
    self.borderRight.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:self.borderRight];
}

- (void)setBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderBottom) {
        [self.borderBottom removeFromSuperlayer];
    }
    borderWidth = [FLViewLine lineWidthWith:borderWidth WithFilament:self.filament];

    self.borderBottom = [FLViewLine CreateLineWithColor:color andWidth:borderWidth];
    
    self.borderBottom.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:self.borderBottom];
}

- (void)setLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    if (self.borderLeft) {
        [self.borderLeft removeFromSuperlayer];
    }
    borderWidth = [FLViewLine lineWidthWith:borderWidth WithFilament:self.filament];

    self.borderLeft = [FLViewLine CreateLineWithColor:color andWidth:borderWidth];
    self.borderLeft.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:self.borderLeft];
}


+ (CALayer*)CreateLineWithColor:(UIColor *)color andWidth:(CGFloat)borderWidth {
    CALayer *line = [CALayer layer];
    line.borderColor = color.CGColor;
    line.borderWidth = borderWidth;
    return line;
}

+ (CGFloat)lineWidthWith:(CGFloat)borderWidth WithFilament:(BOOL)filament{
    if(filament)
        return borderWidth / [UIScreen mainScreen].scale;
    else
        return borderWidth;
}

@end
