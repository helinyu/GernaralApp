
//
//  AppService.m
//  PsychologyApp
//
//  Created by felix on 16/2/17.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "AppService.h"
#import "RestInterface.h"

@implementation AppService

- (void)requestSplashScreenWithSize:(NSString *)sizeType withComplete:(void (^)(AppServiceSplashScreenData *, NSError *))completeBlock{
    
    RestStructSplashScreenRequest *request = [RestStructSplashScreenRequest new];
    request.size = sizeType;
    [RestInterface invokeSplashScreenWithRequest:request withComplete:^(RestStructSplashScreenResponse *response, NSError *error) {
        if (error.code) {
            completeBlock(nil,error);
        }
        
        AppServiceSplashScreenData *appServiceSplashScreenData = [AppServiceSplashScreenData new];
        appServiceSplashScreenData.img = response.img;
        appServiceSplashScreenData.btnDesc = response.btnDesc;
        appServiceSplashScreenData.btnLink = response.btnLink;
        appServiceSplashScreenData.endTimestamp = response.endTimestamp;
        
        completeBlock(appServiceSplashScreenData,nil);
        
    }];
}

@end
