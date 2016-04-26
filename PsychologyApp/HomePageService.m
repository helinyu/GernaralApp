//
//  HomePageService.m
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestInterface.h"
#import "HomePageService.h"
#import "RestStructRequest.h"


@implementation HomePageService

- (void)requestfromViewControllerPsychologyTest:(void(^)(PschologyTestServiceData * serviceData , NSError *error))completeToViewData{
    
    [RestInterface invokeFromHomePageServiceOfPyschologyServiceWithComplete:^(RestStructPsychologyTestResponse *response, NSError *errro) {
        
        if (errro.code != 0) {
            completeToViewData(nil,errro);
            return;
        }
        
        PschologyTestServiceData *pyschologyTestData = [PschologyTestServiceData new];
        pyschologyTestData =(PschologyTestServiceData *)response;
        completeToViewData(pyschologyTestData,nil);
    }];

}

//心理概要
- (void)requestfromViewControllerPschologyTestSummaryWith:(NSString*)title andComplete:(void(^)(PschologyTestSummary_ServiceData * serviceData , NSError *error))completeToViewData{
    
   RestTestSummaryRequest *request = [RestTestSummaryRequest new];
    request.title = title;
    
    [RestInterface invokeFromHomePageServiceOfPschologyTestSummaryService:request withComplete:^(RestStructPschologyTestSummaryResponse *response, NSError *error) {
        if (error.code != 0) {
            completeToViewData(nil,error);
            return ;
        }
        PschologyTestSummary_ServiceData *pyschologyTestSummaryData = [PschologyTestSummary_ServiceData new];
        pyschologyTestSummaryData = (PschologyTestSummary_ServiceData* )response;
        completeToViewData(pyschologyTestSummaryData,nil);
    }];
}

//心理测试题目
- (void)requestfromViewControllerPschologyTestDetail:(NSString*)title andComplete:(void (^)(PschologyTestDetail_ServiceData *serviceData, NSError *error ))completeToViewData{

    RestTestDetailRequest *detailRequest = [RestTestDetailRequest new];
    detailRequest.title = title;
    
    [RestInterface invokeFromHomePageServiceOfPschologyTestDServiceDetail:detailRequest WithComplete:^(RestStructPschologyTestDetailResponse *response, NSError *error) {
        PschologyTestDetail_ServiceData *detailData = [PschologyTestDetail_ServiceData new];
        
        for (RestStructPschologyTestDetailResponseItem *itemRest in response.data) {
            
            PschologyTestDetailItem_ServiceData *itemData = [PschologyTestDetailItem_ServiceData new];
            itemData.title = itemRest.tilte;
            itemData.aChoice = itemRest.aChoice;
            itemData.bChoice = itemRest.bChoice;
            itemData.cChoice = itemRest.cChoice;
            itemData.dChoice = itemRest.dChoice;
            
            [detailData.dataItem addObject:itemData];
            //            NSLog(@"detail data is : %@",itemData);
        }
        completeToViewData(detailData,nil);
    }];
}

- (void)requestResultWithtitle:(NSString *)title WithComplete:(void (^)(PschologyTestResultServiceData *serviceData, NSError *error ))completeToViewData{
    ResultTestStructRequest *request = [ResultTestStructRequest new];
    request.title = title;
    [RestInterface invokeTestResult:request WithComplete:^(ResultTestResponse *response, NSError *error) {
    
        [RestInterface invokeTestResult:request WithComplete:^(ResultTestResponse *response, NSError *error) {
            
            if (error != nil) {
                completeToViewData(nil,error);
            }
            
            PschologyTestResultServiceData * resultServiceData = [PschologyTestResultServiceData new];
            resultServiceData.result_title = response.result_title;
            resultServiceData.result_text = response.result_text;
            completeToViewData(resultServiceData,nil);
        }];
        
    }];
}

- (void)requestScoreResultByTitle:(NSString *)title WithComplete:(void (^)(PschologyScoreResultServiceData *serviceData, NSError *error ))completeToViewData{
    ResultTestStructRequest *request = [ResultTestStructRequest new];
    request.title = title;
    
    [RestInterface invokeTestScoreResult:request WithComplete:^(ScoreResultTestResponse *response, NSError *error) {
        if (error != nil) {
            completeToViewData(nil,error);
        }
        PschologyScoreResultServiceData * resultServiceData = [PschologyScoreResultServiceData new];
        resultServiceData.title = response.title;
        resultServiceData.grade0 = response.grade0;
        resultServiceData.grade1 = response.grade1;
        resultServiceData.grade2 = response.grade2;
        resultServiceData.grade3 = response.grade3;
        resultServiceData.grade4 = response.grade4;
        resultServiceData.grade5 = response.grade5;
        resultServiceData.grade6 = response.grade6;
        completeToViewData(resultServiceData,nil);
    }];
    
//    ResultTestStructRequest *request = [ResultTestStructRequest new];
//           [RestInterface invokeTestResult:request WithComplete:^(ScoreResultTestResponse *response, NSError *error) {
//            
//            if (error != nil) {
//                completeToViewData(nil,error);
//            }
//            
//            PschologyScoreResultServiceData * resultServiceData = [PschologyScoreResultServiceData new];
//               
////            resultServiceData.result_title = response.result_title;
////            resultServiceData.result_text = response.result_text;
//            completeToViewData(resultServiceData,nil);
//        }];
}




@end
