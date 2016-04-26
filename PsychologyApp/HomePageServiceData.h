//
//  HomePageServiceData.h
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "Service.h"

@interface HomePageServiceData : ServiceData

@end

@protocol PschologyTestItem_ServiceData <NSObject>
@end

@interface PschologyTestItem_ServiceData : HomePageServiceData
@property (assign, nonatomic) NSInteger id;
@property (strong, nonatomic) NSString * header_image;
@property (strong, nonatomic) NSString * title;
@property (assign, nonatomic) NSInteger test_number;
@property (assign, nonatomic) NSInteger comment_number;
@end

@interface PschologyTestServiceData : HomePageServiceData
@property (strong, nonatomic) NSArray<PschologyTestItem_ServiceData>* item;
@end

//心理概要
@protocol PschologyTestSummaryItem_ServiceData <NSObject>
@end
@interface PschologyTestSummaryItem_ServiceData : HomePageServiceData
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@end
@interface PschologyTestSummary_ServiceData : HomePageServiceData
@property (strong, nonatomic) NSArray<PschologyTestSummaryItem_ServiceData>* data;
@end

@protocol PschologyTestDetailItem_ServiceData <NSObject>
@end
@interface PschologyTestDetailItem_ServiceData : HomePageServiceData
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *aChoice;
@property (strong,nonatomic) NSString *bChoice;
@property (strong,nonatomic) NSString *cChoice;
@property (strong,nonatomic) NSString *dChoice;
@end
@interface PschologyTestDetail_ServiceData : HomePageServiceData
@property (strong,nonatomic) NSMutableArray<PschologyTestDetailItem_ServiceData> * dataItem;
@end

@interface PschologyTestResultServiceData : HomePageServiceData
@property (nonatomic,strong) NSString *result_title;
@property (nonatomic,strong) NSString *result_text;
@end


@interface  PschologyScoreResultServiceData: ServiceData

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *grade0;
@property (nonatomic,strong) NSString *grade1;
@property (nonatomic,strong) NSString *grade2;
@property (nonatomic,strong) NSString *grade3;
@property (nonatomic,strong) NSString *grade4;
@property (nonatomic,strong) NSString *grade5;
@property (nonatomic,strong) NSString *grade6;

@end

