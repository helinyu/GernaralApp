//
//  ValidateService.h
//  VTR
//
//  Created by felix on 16/1/8.
//  Copyright © 2016年 vanchu. All rights reserved.
//

#import "Service.h"

@interface ValidateService : Service

- (BOOL)isMobile:(NSString *)str;
- (BOOL)isStrictMobile:(NSString *)str;
- (BOOL)isEmail:(NSString *)str;
- (BOOL)isQQ:(NSString *)str;
- (BOOL)isNumFirst:(NSString *)str;
- (BOOL)isGuimiId:(NSString *)str;
- (BOOL)isCaptcha:(NSString *)str;
- (BOOL)isName:(NSString *)str;
- (BOOL)isPassword:(NSString *)str;

@end
