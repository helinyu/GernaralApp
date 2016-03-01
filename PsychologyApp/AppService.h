//
//  AppService.h
//  PsychologyApp
//
//  Created by felix on 16/2/17.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"
#import "AppServiceData.h"
#import "RestStructRequest.h"

@interface AppService : Service

- (void)requestSplashScreenWithSize:(NSString *)sizeType withComplete:(void (^)(AppServiceSplashScreenData *, NSError *))completeBlock;

@end
