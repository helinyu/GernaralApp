//
//  FLDatePicker.h
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLDatePicker : UIView

+ (FLDatePicker *)makeWithTitle:(NSString *)title;

-(void)showInView:(UIView *)parentView withConfirm:(void (^)(NSDate* date ,NSInteger index))confirmBlock;

@end
