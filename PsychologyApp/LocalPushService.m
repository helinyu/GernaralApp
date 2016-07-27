//
//  LocalPushService.m
//  CarCalc
//
//  Created by wen on 15/12/31.
//  Copyright © 2015年 Vanchu. All rights reserved.
//

#import "LocalPushService.h"
#import "UISwitch+On.h"
#import "NSDate+NSString.h"

CGFloat const backLocalTimeInterval3 = 5;

@implementation LocalPushService
- (void)scheduleBackActivity {
    
    if ([UISwitch isAaronLiBtnON] == false) {
        [self clearBackActivity];
        // create back local push
        [self _scheduleNotificationWithDate:[[NSDate new] dateByAddingTimeInterval:backLocalTimeInterval3] AlertBody:@"生活应该快乐，如果你不快乐，请打开舒心！！！" userInfo:nil];
    }else{
        
        NSInteger fromDateNum = [[NSUserDefaults standardUserDefaults] integerForKey:From_Date_Num] - 8*60*60;
        NSInteger toDateNum = [[NSUserDefaults standardUserDefaults] integerForKey:To_Date_Num] - 8*60*60;
        NSInteger scheduleDateNum = [[NSDate new] timeIntervalSince1970]+backLocalTimeInterval3 ;
        
        if ((scheduleDateNum > fromDateNum)&&(scheduleDateNum < toDateNum) ) {
            return;
        }
        
    [self clearBackActivity];
    // create back local push
    [self _scheduleNotificationWithDate:[[NSDate new] dateByAddingTimeInterval:backLocalTimeInterval3] AlertBody:@"生活应该快乐，如果你不快乐，请打开舒心！！！" userInfo:nil];
    }
}

- (void)clearBackActivity {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)_scheduleNotificationWithDate:(NSDate *)date AlertBody:(NSString *)body userInfo:(NSDictionary *)info{
    UILocalNotification *notification = [UILocalNotification new];
    notification.fireDate = date;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = body;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 0;
    notification.userInfo = info;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
