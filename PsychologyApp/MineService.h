//
//  FeedbackService.h
//  PsychologyApp
//
//  Created by felix on 16/4/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"
#import "RestInterface.h"

@interface MineService : Service
//反馈
- (void)requestFeedbackWithImageUrl1:(NSString*)iamgeurl_1 WithImageUrl2:(NSString*)iamgeurl_2 WithImageUrl3:(NSString*)iamgeurl_3 WithFeedback_text:(NSString*)feedback_text withComplete:(void(^)(RetServiceData* serviceData ,NSError *error)) completeToView ;

@end
