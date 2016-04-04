//
//  Model.h
//  PsychologyApp
//
//  Created by felix on 16/3/9.
//  Copyright © 2016年 felix. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>
#import "EntityUser.h"

@interface Model : NSObject

@property (strong, nonatomic) EntityUser *user;

+ (instancetype)sharedInstance;

- (void)commitUser;
- (EntityUser*)loadUseByUId:(NSString *)uId;

@end
