//
//  HomePageService.m
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "HomePageService.h"
#import "RestInterface.h"

@implementation HomePageService

- (void)requestfromViewControllerPsychologyTest:(void(^)(NSString *imageUrl, NSString *testTitle, NSInteger testNumber , NSInteger commentNumber))completeToViewData{
    [RestInterface invokeFromHomePageServiceOfPyschologyServiceWithComplete:^(RestStructPsychologyTestResponse *response, NSError *errro) {
        
    }];

}


@end
