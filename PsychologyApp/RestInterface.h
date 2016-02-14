//
//  RestInterface.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestStructRequest.h"
#import "RestStructResponse.h"

@interface RestInterface : NSObject

//通过手机登录
+ (void)invokeRegisterWithRequest:(RestStructRegisterByPhoneRequest*)request withComplete:(void(^)(RestStructRegisterResponse *response,NSError *error))completeBlock ;



@end
