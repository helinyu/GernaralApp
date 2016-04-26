//
//  HomePageServiceData.m
//  PsychologyApp
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "HomePageServiceData.h"

@implementation HomePageServiceData
@end

@implementation PschologyTestItem_ServiceData
@end

@implementation PschologyTestServiceData
@end

@implementation PschologyTestSummaryItem_ServiceData
@end
@implementation PschologyTestSummary_ServiceData
@end

@implementation PschologyTestDetailItem_ServiceData
- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"";
        _aChoice = @"";
        _bChoice = @"";
        _cChoice = @"";
        _dChoice = @"";
    }
    return self;
}
@end
@implementation PschologyTestDetail_ServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataItem = (NSMutableArray<PschologyTestDetailItem_ServiceData>*)[NSMutableArray new];
    }
    return self;
}
@end

@implementation PschologyTestResultServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _result_title = @"";
        _result_text = @"";
    }
    return self;
}

@end

@implementation PschologyScoreResultServiceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"";
        _grade0 = @"";
        _grade1 = @"";
        _grade2 = @"";
        _grade3 = @"";
        _grade4 = @"";
        _grade5 = @"";
        _grade6 = @"";
    }
    return self;
}

@end
