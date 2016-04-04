//
//  NSString+plist.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "NSString+plist.h"

@implementation NSString (plist)

+ (NSString*)getOrCreateFilePathByFileName:(NSString*)fileName{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *fileWholePath =[path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    
    BOOL fileIsExist = [[NSFileManager defaultManager] fileExistsAtPath:fileWholePath];
    if (!fileIsExist) {
        [[NSFileManager defaultManager] createFileAtPath:fileWholePath contents:nil attributes:nil];
    }
    //获取路径
    return fileWholePath ;
}

//get the value by the attibute
+ (NSString *)getAttribute_PlistWithKeyWord:(NSString *)attribute withFileName:(NSString*)filename{
    NSString *filePath = [NSString getOrCreateFilePathByFileName:filename];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return [dict objectForKey:attribute];
}

//
+ (void)setAttributeForKeyword:(NSString*)attribute  withValue:(NSString*)value withFileName:(NSString*)filename{
  
    NSString *filePath = [NSString getOrCreateFilePathByFileName:filename];
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    NSMutableDictionary * fileDict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
   
    if (fileDict ) {
        dict = fileDict ;
    }
    
    [dict setObject:value forKey:attribute];
    [dict writeToFile:filePath atomically:YES];
}

@end
