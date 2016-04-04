//
//  SettingService.h
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"
#import "SettingServiceData.h"

@interface SettingService : Service

- (void)requestUpdate:(void(^)(SettingServiceData * serviceData,NSError *error))completeToViewData;
@end
