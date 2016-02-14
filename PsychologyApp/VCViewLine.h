//
//  GMViewLine.h
//  guimiquan
//
//  Created by Daly on 15/4/9.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import "VCView.h"

IB_DESIGNABLE

@interface VCViewLine : UIView

@property (assign, nonatomic) IBInspectable BOOL lineTop;
@property (assign, nonatomic) IBInspectable BOOL lineLeft;
@property (assign, nonatomic) IBInspectable BOOL lineBottom;
@property (assign, nonatomic) IBInspectable BOOL lineRight;

@property (assign, nonatomic) IBInspectable CGFloat lineWidth;

@property (strong, nonatomic) IBInspectable UIColor *lineColor;

@property (assign, nonatomic) IBInspectable BOOL filament;

@end


