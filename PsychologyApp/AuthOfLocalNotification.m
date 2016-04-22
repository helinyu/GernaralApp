//
//  AuthOfLocalNotification.m
//  CommonComponent
//
//  Created by felix on 16/3/17.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "AuthOfLocalNotification.h"

@implementation AuthOfLocalNotification
+ (void)registerLocalPush{
    if ([[UIApplication sharedApplication]currentUserNotificationSettings].types == UIUserNotificationTypeNone) {
        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
    }
}
@end
