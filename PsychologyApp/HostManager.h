//
//  HostManager.h
//  CarCalc
//
//  Created by wen on 16/1/6.
//  Copyright © 2016年 Vanchu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OBTAIN_COMMON_HOST [[HostManager sharedInstance] get].commonHost
#define OBTAIN_VTR_HOST [[HostManager sharedInstance] get].vtrHost
#define OBTAIN_IMAGE_URL [[HostManager sharedInstance] get].shareImageUrl

@interface HostManagerDataServer : NSObject
@property (strong, nonatomic) NSString *commonHost;
@property (strong, nonatomic) NSString *vtrHost;
@property (strong, nonatomic) NSString *shareImageUrl;
@end

@interface HostManager : NSObject

+ (instancetype)sharedInstance;
- (HostManagerDataServer *)get;

- (void)switchToTest;
- (void)switchToRelease;

@end
