//
//  EditProfileServiceData.h
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"

@interface EditProfileServiceData : ServiceData

@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) BOOL sex;
@property (nonatomic,strong) NSString *region;
@property (nonatomic,strong) NSString *briefIntroduction;

@end

@interface EditProfileFinishedServiceData : ServiceData

@property (nonatomic,assign) NSInteger ret;

@end
