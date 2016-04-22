//
//  FeedbackService.m
//  PsychologyApp
//
//  Created by felix on 16/4/22.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineService.h"
#import "RestStructRequest.h"

@implementation MineService

- (void)requestFeedbackWithImageUrl1:(NSString*)iamgeurl_1 WithImageUrl2:(NSString*)iamgeurl_2 WithImageUrl3:(NSString*)iamgeurl_3 WithFeedback_text:(NSString*)feedback_text withComplete:(void(^)(RetServiceData* serviceData ,NSError *error)) completeToView {
    
    FeedbackRequest *request = [FeedbackRequest new];
    request.iamgeurl_1 = iamgeurl_1;
    request.iamgeurl_2 = iamgeurl_2;
    request.iamgeurl_3 = iamgeurl_3;
    request.feedback_text = feedback_text;
    
    [RestInterface invokeFeedback:request withComplete:^(RetResponse *reponse, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        RetServiceData  *serviceData = [RetServiceData new];
        serviceData.ret = reponse.ret;
        completeToView(serviceData,nil);
    }];
    
    
}

@end
