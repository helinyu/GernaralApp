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



