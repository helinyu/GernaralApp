//
//  ServiceManager.h
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OBTAIN_SERVICE(classname) ((classname *)[[ServiceManager sharedInstance] serviceWithClass:classname.class])

@interface ServiceManager : NSObject

+ (instancetype)sharedInstance;

- (id)serviceWithClass:(Class)class;

@end

#import "HomePageService.h"
#import "SettingService.h"
#import "LocalPushService.h"
#import "EditProfileService.h"
