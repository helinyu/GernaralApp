//
//  UISwitch+On.m
//  PsychologyApp
//
//  Created by felix on 16/4/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "UISwitch+On.h"
#import "AppDefinition.h"

@implementation UISwitch (On)

+ (BOOL)isAaronLiBtnON{
    BOOL switch_on = [[NSUserDefaults standardUserDefaults] boolForKey:SWITCH_ON];
    if (switch_on == true) {
        return true;
    }else{
        return  false;
    }
}

@end
