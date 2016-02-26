//
//  Helper+System.h
//  guimiquan
//
//  Created by Daly on 14/11/27.
//  Copyright (c) 2014年 Vanchu. All rights reserved.
//

#import "Helper.h"

@interface Helper (System)

+ (BOOL)isEqualToIOS6;

+ (BOOL)isEqualToIOS7;

+ (BOOL)isGreaterOrEqualToIOS7;

+ (BOOL)isGreaterOrEqualToIOS8;

+ (BOOL)isEqualToIPhone6;

+ (BOOL)isEqualToIPhone6Plus;

+ (BOOL)isEqualToSmallScreen;

+ (BOOL)isRetina;

+ (NSString *)getDeviceID;

+ (NSData *)getPushDeviceToken;

+ (NSString *)getPushDeviceTokenStr;

+ (NSString *)getSysModel;

+ (NSString *)getSysName;

+ (NSString *)getSysVersion;

+ (NSString *)deviceString;

+ (NSString *)appVersion;

@end
