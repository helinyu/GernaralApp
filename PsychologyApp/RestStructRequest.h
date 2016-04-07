//
//  RestStructRequest.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface RestStructRequest : NSObject

@property (strong, nonatomic) NSMutableDictionary *params;
- (NSData *) toPostBody;

@end

@interface RestStructRegisterByPhoneRequest : RestStructRequest
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *password;
@end

@interface RestStructLoginByPhoneRequest : RestStructRequest
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *password;
@end

#pragma mark --闪屏请求与响应
@interface RestStructSplashScreenRequest : RestStructRequest
@property (strong, nonatomic) NSString *size;
@end

#pragma mark ---概述

@interface RestTestSummaryRequest : RestStructRequest
@property (strong,nonatomic) NSString *title;
@end

@interface RestTestDetailRequest : RestStructRequest
@property (strong,nonatomic) NSString *title;
@end


@interface RestStructEditProfileRequest : RestStructRequest
@property (strong,nonatomic) NSString *phone;
@end

@interface RestStructFinishedEditProfileRequest : RestStructRequest
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) BOOL sex;
@property (nonatomic,strong) NSString *region;
@property (nonatomic,strong) NSString *briefIntroduction;
@end

@interface RestStructMarriageLoveRequest : RestStructRequest
@property (nonatomic,assign) NSInteger category_id;
@property (nonatomic,strong) NSString *key;
@property (nonatomic,assign) NSInteger offset;
@property (nonatomic,assign) NSInteger limit;
@end