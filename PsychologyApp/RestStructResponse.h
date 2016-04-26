//
//  RestStructResponse.h
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RestStructResponse : JSONModel

@end

//注册的返回码
@interface RestStructRegisterResponse : RestStructResponse
@property (assign ,nonatomic) NSInteger ret;
@end

//登录的返回码
@interface RestStructLoginResponse : RestStructResponse
@property (assign ,nonatomic) NSInteger ret;
@end

//闪屏广告
@interface RestStructSplashScreenResponse : RestStructResponse

@property (strong, nonatomic) NSString * image_name;
@property (strong, nonatomic) NSString * image_link;

@end

//心理测试
@protocol RestStructPsychologyTestResponseItem <NSObject>
@end
@interface RestStructPsychologyTestResponseItem : RestStructResponse
@property (assign, nonatomic) NSInteger id;
@property (strong, nonatomic) NSString * header_image;
@property (strong, nonatomic) NSString * title;
@property (assign, nonatomic) NSInteger test_number;
@property (assign, nonatomic) NSInteger comment_number;
@end

@interface RestStructPsychologyTestResponse : RestStructResponse
@property (strong, nonatomic) NSArray<RestStructPsychologyTestResponseItem>* item;
@end

//心理概要
@protocol RestStructPschologyTestSummaryResponseItem <NSObject>
@end
@interface RestStructPschologyTestSummaryResponseItem : RestStructResponse
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@end

@interface RestStructPschologyTestSummaryResponse : RestStructResponse
@property (strong, nonatomic) NSArray<RestStructPschologyTestSummaryResponseItem>* data;
@end


@protocol RestStructPschologyTestDetailResponseItem <NSObject>
@end
@interface RestStructPschologyTestDetailResponseItem : RestStructResponse
@property (nonatomic,strong) NSString *tilte;
@property (nonatomic,strong) NSString *aChoice;
@property (nonatomic,strong) NSString *bChoice;
@property (nonatomic,strong) NSString *cChoice;
@property (nonatomic,strong) NSString *dChoice;
@end
@interface RestStructPschologyTestDetailResponse : RestStructResponse
@property (strong, nonatomic) NSArray<RestStructPschologyTestDetailResponseItem>* data;
@end

//测试之后的结果
@interface ResultTestResponse : RestStructResponse
@property (nonatomic,strong) NSString *result_title;
@property (nonatomic,strong) NSString *result_text;
@end

@interface ScoreResultTestResponse : RestStructResponse
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *grade0;
@property (nonatomic,strong) NSString *grade1;
@property (nonatomic,strong) NSString *grade2;
@property (nonatomic,strong) NSString *grade3;
@property (nonatomic,strong) NSString *grade4;
@property (nonatomic,strong) NSString *grade5;
@property (nonatomic,strong) NSString *grade6;
@end

//update
@interface RestStructUpdateResponse : RestStructResponse
@property (strong,nonatomic) NSString *version;
@property (strong,nonatomic) NSString *url;
@end

//编辑资料
@interface RestStructEditProfileResponse : RestStructResponse

@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) BOOL sex;
@property (nonatomic,strong) NSString *region;
@property (nonatomic,strong) NSString *briefIntroduction;

@end

@interface RestStructFinishedEditProfileResponse : RestStructResponse
@property (nonatomic,assign) NSInteger ret;
@end

//婚恋
@interface RestStructMarriageLoveResponse: RestStructResponse
@end


#pragma mark -- topic
//话题
@protocol RestStructTopicItemResponse <NSObject>
@end
@interface RestStructTopicItemResponse : RestStructResponse
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,strong) NSString *theme;
@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *location;
@property (nonatomic,assign) NSInteger praiseNum;
@property (nonatomic,assign) NSInteger commentsNum;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *headerImageUrl;

@end
@interface RestStructTopicResponse : RestStructResponse
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) NSArray<RestStructTopicItemResponse>* topic;
@end

////评论
//@protocol CommentItemStructReponse <NSObject>
//@end
//@interface CommentItemStructReponse :RestStructResponse
//@property (nonatomic,strong) NSString *content;
//@end
//@interface CommentsStructResponse : RestStructResponse
//@property (nonatomic,assign) NSInteger number;
//@property (nonatomic,strong) NSArray<CommentItemStructReponse>* data;
//@end

//话题创建 应该改为topic
@interface CommentsCreationResponse : RestStructResponse
@property (nonatomic,assign) NSInteger ret;
@end

//发表评论
@interface CommentSendingResponse : RestStructResponse
@property (nonatomic,assign) NSInteger ret;
@end

//话题对应的评论
@protocol CommentsOfTopicItemResponse <NSObject>
@end
@interface CommentsOfTopicItemResponse :RestStructResponse
@property (nonatomic,assign) NSInteger topic_id;
@property (nonatomic,strong) NSString *person_phone;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *headerImageUrl;
@end
@interface CommentsOfTopicResponse : RestStructResponse
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) NSArray<CommentsOfTopicItemResponse>* datas;
@end


//更新话题中的点赞内容
@interface TopicUPdatePraiseResponse :RestStructResponse
@property (nonatomic,assign) NSInteger ret;
@end

@interface RetResponse : RestStructResponse
@property (nonatomic,assign) NSInteger ret;
@end