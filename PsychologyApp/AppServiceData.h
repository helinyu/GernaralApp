//
//  AppServiceData.h
//  VTR
//
//  Created by felix on 16/1/7.
//  Copyright © 2016年 vanchu. All rights reserved.
//

#import "Service.h"

@interface AppServiceData : ServiceData

@end

@interface AppServiceSplashScreenData : AppServiceData

@property (strong,nonatomic) NSString * btnDesc;
@property (strong,nonatomic) NSString * btnLink;
@property (assign,nonatomic) NSTimeInterval endTimestamp;
@property (strong,nonatomic) NSString * img;

@end
