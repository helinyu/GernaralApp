//
//  HomePageService.h
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"

@interface HomePageService : Service

//心理测试的界面
- (void)requestfromViewControllerPsychologyTest:(void(^)(NSString *imageUrl, NSString *testTitle, NSInteger testNumber , NSInteger commentNumber))completeToViewData;

@end
