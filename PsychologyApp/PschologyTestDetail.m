//
//  PschologyTestDetail.m
//  PsychologyApp
//
//  Created by felix on 16/3/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTestDetail.h"
#import "ServiceManager.h"
#import "PschologyTestResult.h"
#import "PschologyTestDetailCell.h"


#define NUMBERLABEL_OF_DETAIL 4

@interface PschologyTestDetail ()


@property (strong,nonatomic) PschologyTestDetail_ServiceData *testDetailData;
@property (strong,nonatomic) PschologyTestDetailItem_ServiceData *testDetailItemData;
@property (strong,nonatomic) NSMutableArray<PschologyTestDetailItem_ServiceData> *testDetailItemDatas;
@end


@implementation PschologyTestDetail


- (void)viewDidLoad {
    [super viewDidLoad];
    _testDetailItemDatas = [NSMutableArray<PschologyTestDetailItem_ServiceData> new];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PschologyTestDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PschologyTestDetailCell class])];
    
    [self loadTestData];
    self.navigationItem.title = @"测试";
}

- (void)loadTestData{
    
    [OBTAIN_SERVICE(HomePageService) requestfromViewControllerPschologyTestDetail:self.paramTitle andComplete:^(PschologyTestDetail_ServiceData *serviceData, NSError *error) {
        _testDetailData = [PschologyTestDetail_ServiceData new];
        _testDetailItemData = [PschologyTestDetailItem_ServiceData new];
        _testDetailItemDatas = serviceData.dataItem;
        _testDetailData = (PschologyTestDetail_ServiceData*)serviceData;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [(NSMutableArray*)_testDetailData.dataItem count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBERLABEL_OF_DETAIL;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSMutableString *title = [NSMutableString new];
    [title appendString:@" 题目:"];
     _testDetailItemData = _testDetailData.dataItem[section];
    [title appendString:_testDetailItemData.title];
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _testDetailItemData = _testDetailData.dataItem[indexPath.section] ;
    
    PschologyTestDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PschologyTestDetailCell class]) forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            [cell configureCellOfDescription:_testDetailItemData.aChoice];
            break;
        case 1:
            [cell configureCellOfDescription:_testDetailItemData.bChoice];
            break;
        case 2:
            [cell configureCellOfDescription:_testDetailItemData.cChoice];
            break;
        case 3:
            [cell configureCellOfDescription:_testDetailItemData.dChoice];
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (IBAction)onComputeClicked:(id)sender {
    PschologyTestResult *result = [[UIStoryboard storyboardWithName:@"HomePage" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PschologyTestResult class])];
    [self.navigationController pushViewController:result animated:true];
}

//http://localhost/foreheard/homePage/psychology_test/fetch_Pschology_detail.php

@end
