//
//  UIView+Helper.h
//  guimiquan
//
//  Created by emaly on 15/4/1.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helper)

/**
 *  设置图片遮罩view
 *
 *  @param view  被遮罩的view
 *  @param frame 遮罩的大小(在view内部frame)
 */
- (void)setMaskLayer:(UIImage*)image maskFrame:(CGRect)rect;

@end
