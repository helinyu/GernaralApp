//
//  LocalPushService.h
//  CarCalc
//
//  Created by wen on 15/12/31.
//  Copyright © 2015年 Vanchu. All rights reserved.
//

#import "Service.h"
#import <UIKit/UIKit.h>

@interface LocalPushService : Service
//拉回流
- (void)scheduleBackActivity;

@end
