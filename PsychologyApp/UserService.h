//
//  UserService.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestStructResponse.h"

@interface UserService : NSObject
- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withDeviceToken:(NSString *)deviceToken ;

//- (void)requestRegisterWithMobile:(NSString *)phone withPassword:(NSString *)password;

- (void)requestRegisterWithMobile:(NSString *)phone withPassword:(NSString *)password withComplete:(void (^)(NSInteger ret))completeBlock;

- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withComplete:(void (^)(NSInteger ret))completeBlock;



@end
