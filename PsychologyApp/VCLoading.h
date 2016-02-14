//
//  VCLoading.h
//  guimiquan
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 Vanchu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCLoading : UIView

+ (VCLoading *)make:(NSString *)message;

- (void)show;
- (void)showInFrame:(CGRect)frame autoHidden:(BOOL)hidden;
- (void)hide;
@end
