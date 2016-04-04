//
//  HomePageService.h
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"
#import "HomePageServiceData.h"


@interface HomePageService : Service

//心理测试的界面
- (void)requestfromViewControllerPsychologyTest:(void(^)(PschologyTestServiceData * serviceData , NSError *error))completeToViewData;

//心理概要
- (void)requestfromViewControllerPschologyTestSummaryWith:(NSString*)title andComplete:(void(^)(PschologyTestSummary_ServiceData * serviceData , NSError *error))completeToViewData;

//心理测试的题目
- (void)requestfromViewControllerPschologyTestDetail:(NSString*)title andComplete:(void (^)(PschologyTestDetail_ServiceData *serviceData, NSError *error ))completeToViewData;


@end
