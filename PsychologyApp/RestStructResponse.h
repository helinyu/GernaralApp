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




