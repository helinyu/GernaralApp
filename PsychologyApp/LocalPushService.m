//
//  LocalPushService.m
//  CarCalc
//
//  Created by wen on 15/12/31.
//  Copyright © 2015年 Vanchu. All rights reserved.
//

#import "LocalPushService.h"

CGFloat const backLocalTimeInterval3 = 60*60*24;

@implementation LocalPushService
- (void)scheduleBackActivity {

    [self clearBackActivity];
 
    // create back local push
    [self _scheduleNotificationWithDate:[[NSDate new] dateByAddingTimeInterval:backLocalTimeInterval3] AlertBody:@"生活应该快乐，如果你不快乐，请打开舒心！！！" userInfo:nil];
}

- (void)clearBackActivity {
    // 清空旧的本地通知
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
