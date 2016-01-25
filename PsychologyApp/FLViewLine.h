//
//  GMViewLine.h
//  guimiquan

//  Created by felix on 16/1/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface FLViewLine : UIView

@property (assign, nonatomic) IBInspectable BOOL lineTop;
@property (assign, nonatomic) IBInspectable BOOL lineLeft;
@property (assign, nonatomic) IBInspectable BOOL lineBottom;
@property (assign, nonatomic) IBInspectable BOOL lineRight;

@property (assign, nonatomic) IBInspectable CGFloat lineWidth;
@property (strong, nonatomic) IBInspectable UIColor *lineColor;
@property (assign, nonatomic) IBInspectable BOOL filament;

@end


