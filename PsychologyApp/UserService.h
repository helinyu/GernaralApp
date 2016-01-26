//
//  UserService.h
//  PsychologyApp
//
//  Created by felix on 16/1/25.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserService : NSObject
- (void)requestLoginWithMobile:(NSString *)phone withPassword:(NSString *)password withDeviceToken:(NSString *)deviceToken ;

@end
