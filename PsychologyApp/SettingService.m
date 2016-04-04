//
//  SettingService.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "SettingService.h"
#import "RestInterface.h"
#import "SettingServiceData.h"

@implementation SettingService

- (void)requestUpdate:(void(^)(SettingServiceData * serviceData,NSError *error))completeToViewData{
    
    [RestInterface invokeUpdateWithComplete:^(RestStructUpdateResponse *response, NSError *error) {
        
        if (error.code != 0) {
            completeToViewData(nil,error);
            return ;
        }
        
        SettingServiceData *serviceData = [SettingServiceData new];
        serviceData.version = response.version;
        serviceData.url = response.url;
        completeToViewData(serviceData,nil);
    }];
}


@end
