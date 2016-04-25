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

- (void)requestMyCommnents:(NSString*)person_phone withComplete:(void(^)(CommentsOfTopicServiceData* serviceData ,NSError *error)) completeToView {
    
    MyCommentsStructRequest *request = [MyCommentsStructRequest new];
    request.person_phone = person_phone;
    
    [RestInterface invoketopicOfMyComments:request WithComplete:^(CommentsOfTopicResponse *response, NSError *error) {
        if (error != nil) {
            completeToView(nil,error);
            return ;
        }
        CommentsOfTopicServiceData *commentServiceData = [CommentsOfTopicServiceData new];
        commentServiceData.number = response.number;
        
        for (CommentsOfTopicItemResponse *item in response.datas) {
            CommentsOfTopicItemServiceData *itemServiceData = [CommentsOfTopicItemServiceData new];
            itemServiceData.topic_id = item.topic_id;
            itemServiceData.person_phone = item.person_phone;
            itemServiceData.content = item.content;
            itemServiceData.time = item.time;
            itemServiceData.headerImageUrl = item.headerImageUrl;
            [commentServiceData.datas addObject:itemServiceData];
        }
        completeToView(commentServiceData,nil);
    }];

}


@end
