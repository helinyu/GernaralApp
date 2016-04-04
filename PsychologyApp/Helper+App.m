//
//  Helper+App.m
//  
//
//  Created by felix on 16/4/4.
//
//

#import "Helper+App.h"

@implementation Helper (App)

+ (NSString*)getAppVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
