//
//  NSDate+NSString.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "NSDate+NSString.h"

@implementation NSDate (NSString)

- (NSString *)dateToStringDisplayHourMinuteSecond{
    NSInteger secondInterval =(NSInteger)[self timeIntervalSince1970];
    NSInteger tmp = secondInterval % (24*60*60) ;
    NSInteger hour = tmp / (60*60) ;
              tmp = secondInterval % (60*60) ;
    NSInteger minute = tmp / 60 ;
    NSInteger second = tmp % 60 ;
    NSString *timeStr = [NSString stringWithFormat:@"%ld:%ld:%ld",(long)hour,(long)minute,(long)second];
    return timeStr;
}

- (NSString *)dateOfNowToString{
    
    NSInteger secondInterval =(NSInteger)[self timeIntervalSince1970];
    secondInterval = secondInterval + 8*60*60;
    NSDate* date = [NSDate dateWithTimeIntervalSinceReferenceDate:secondInterval];
    return [NSString stringWithFormat:@"%@",date];
}

- (NSInteger)dateOfBeijingTime{
    NSInteger secondInterval =(NSInteger)[self timeIntervalSince1970];
    secondInterval = secondInterval + 8*60*60;
    return secondInterval;
}

@end
