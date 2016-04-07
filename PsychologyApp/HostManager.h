//
//  HostManager.h
//  CarCalc
//
//  Created by wen on 16/1/6.
//  Copyright © 2016年 Vanchu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OBTAIN_COMMON_HOST [[HostManager sharedInstance] get].commonHost
#define OBTAIN_YIAPI_HOST [[HostManager sharedInstance] get].yiApiHost
#define OBTAIN_IMAGE_URL [[HostManager sharedInstance] get].shareImageUrl

@interface HostManagerDataServer : NSObject
@property (strong, nonatomic) NSString *commonHost;
@property (strong, nonatomic) NSString *yiApiHost;
@property (strong, nonatomic) NSString *shareImageUrl;
@end

@interface HostManager : NSObject

+ (instancetype)sharedInstance;
- (HostManagerDataServer *)get;

- (void)switchToTest;
- (void)switchToRelease;

@end
