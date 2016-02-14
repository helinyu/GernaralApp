//
//  VCButton.h
//  VTR
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 vanchu. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface VCButton : UIButton
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (strong, nonatomic) IBInspectable UIColor *backgroundNormalColor;
@property (strong, nonatomic) IBInspectable UIColor *backgroundHighlightedColor;
@property (strong, nonatomic) IBInspectable UIColor *backgroundSelectedColor;
@property (strong, nonatomic) IBInspectable UIColor *backgroundDisabledColor;

- (void) setBackgroundImageWithColor:(UIColor *)color forState:(UIControlState)state;

@end
