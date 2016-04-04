//
//  NSString+plist.h
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (plist)

+ (NSString*)getOrCreateFilePathByFileName:(NSString*)fileName;
+ (NSString *)getAttribute_PlistWithKeyWord:(NSString *)attribute withFileName:(NSString*)filename;
+ (void)setAttributeForKeyword:(NSString*)attribute  withValue:(NSString*)value withFileName:(NSString*)filename;

@end
