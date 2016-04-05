//
//  EditProfileService.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "EditProfileService.h"
#import "RestInterface.h"

@implementation EditProfileService

- (void)requestEditProfie:(NSString*)phone withComplete:(void(^)(EditProfileServiceData* serviceData ,NSError *error)) completeToView {

    RestStructEditProfileRequest *request = [RestStructEditProfileRequest new];
    request.phone = phone;
    
    [RestInterface invokeEditProfile:request withComplete:^(RestStructEditProfileResponse *response, NSError *error) {
        
        if ( error != nil) {
            completeToView(nil,error);
            return ;
        }
        
        EditProfileServiceData *serviceData = [EditProfileServiceData new];
        serviceData.phone = response.phone;
        serviceData.password = response.password;
        serviceData.nickname = response.nickname ;
        serviceData.age = response.age;
        serviceData.sex = response.sex;
        serviceData.region = response.region;
        serviceData.briefIntroduction = response.briefIntroduction;
  
        completeToView(serviceData,nil);
        
    }];
}

- (void)requestFinishedEditProfie:(NSString*)phone  withPassword:(NSString*)password withAge:(NSInteger)age withSex:(BOOL)sex withRegion:(NSString*)region withBriefIntroduction:(NSString*)briefIntroduction withNickname:(NSString*)nickname withComplete:(void(^)(EditProfileFinishedServiceData* serviceData ,NSError *error)) completeToView {
    
    RestStructFinishedEditProfileRequest *request = [RestStructFinishedEditProfileRequest new];
    request.phone = phone;
    request.password = password;
    request.age = age;
    request.sex = sex;
    request.region = region;
    request.briefIntroduction = briefIntroduction;
    request.nickname = nickname;
    
    [RestInterface invokeFinishedEditProfile:request withComplete:^(RestStructFinishedEditProfileResponse *response, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        
        EditProfileFinishedServiceData *serviceData = [EditProfileFinishedServiceData new];
        serviceData.ret = response.ret;
        completeToView(serviceData,nil);
    }];
}

@end
