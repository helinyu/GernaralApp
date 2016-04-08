//
//  AutomationTextLabel.h
//  hairstyle
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 helen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutomationTextLabel : UILabel
/**
 *  初始化方法
 *
 *  @param textArray label中的动画的字符串数组
 *
 *  @return AutomationTextLabel obj
 */
- (instancetype)initWithTexts:(NSMutableArray*)textArray;

- (void)startAnimation;
- (void)stopAnimationAtStateIdle;
- (void)stopAnimationAtStatePulling;
- (void)stopAnimation;

@end
