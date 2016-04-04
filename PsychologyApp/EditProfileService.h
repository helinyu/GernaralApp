//
//  EditProfileService.h
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"
#import "EditProfileServiceData.h"

@interface EditProfileService : Service

- (void)requestEditProfie:(NSString*)phone withComplete:(void(^)(EditProfileServiceData* serviceData ,NSError *error)) completeToView ;

@end
