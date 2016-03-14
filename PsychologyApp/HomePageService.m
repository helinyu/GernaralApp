//
//  HomePageService.m
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "RestInterface.h"
#import "HomePageService.h"

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
- (void)requestfromViewControllerPschologyTestSummary:(void(^)(PschologyTestSummary_ServiceData * serviceData , NSError *error))completeToViewData{

    [RestInterface invokeFromHomePageServiceOfPschologyTestSummaryServiceWithComplete:^(RestStructPschologyTestSummaryResponse *response, NSError *error) {
       
        if (error.code != 0) {
            completeToViewData(nil,error);
            return ;
        }
        
        PschologyTestSummary_ServiceData *pyschologyTestSummaryData = [PschologyTestSummary_ServiceData new];
        pyschologyTestSummaryData = (PschologyTestSummary_ServiceData* )response;
        completeToViewData(pyschologyTestSummaryData,nil);
    }];
}

@end
