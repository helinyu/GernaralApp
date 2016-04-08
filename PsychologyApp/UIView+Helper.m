//
//  UIView+Helper.m
//  guimiquan
//
//  Created by emaly on 15/4/1.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)

- (void)setMaskLayer:(UIImage*)image maskFrame:(CGRect)rect {
    
    CALayer *roundCornerLayer = [CALayer layer];
    roundCornerLayer.frame = rect;
    roundCornerLayer.contents = (id)[image CGImage];
    [self.layer setMask:roundCornerLayer];
}

@end
