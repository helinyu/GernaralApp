//
//  Service.h
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDefinition.h"

@interface Service : NSObject
@end

@interface ServiceDataAdapter : NSObject
+ (void)convertFrom:(id)fromData to:(id)toData;
@end

@interface ServiceData : NSObject
@end

@interface RetServiceData : ServiceData
@property (nonatomic,assign) NSInteger ret;
@end