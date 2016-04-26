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
#import "FLIndexPath.h"

#define NUMBERLABEL_OF_DETAIL 4

@interface PschologyTestDetail ()<PschologyTestDetailCellDelegate>
@property (strong,nonatomic) PschologyTestDetail_ServiceData *testDetailData;
@property (strong,nonatomic) PschologyTestDetailItem_ServiceData *testDetailItemData;
@property (strong,nonatomic) NSMutableArray<PschologyTestDetailItem_ServiceData> *testDetailItemDatas;
@property (nonatomic,strong) NSMutableArray<FLIndexPath>* indexpaths;
@end

@implementation PschologyTestDetail


- (void)viewDidLoad {
    [super viewDidLoad];
    _testDetailItemDatas = [NSMutableArray<PschologyTestDetailItem_ServiceData> new];
    _indexpaths = [NSMutableArray<FLIndexPath> new];
    
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
    cell.detailCellDelegate = self;
    
 //    这里只是进行基本的初始化
    if ([self isHasTarget:indexPath] == false) {
        FLIndexPath *indexP = [FLIndexPath new];
        indexP.indexPath = indexPath;
        [_indexpaths addObject:indexP];
        indexP.hasChoice = false;
    }
    
//   每一次都要进行寻找
    FLIndexPath *flIndexPath = [self getTarget:indexPath];
    switch (indexPath.row) {
        case 0:
            [cell configureCellOfDescription:_testDetailItemData.aChoice withNSIndexPath:flIndexPath];
            break;
        case 1:
            [cell configureCellOfDescription:_testDetailItemData.bChoice withNSIndexPath:flIndexPath];
            break;
        case 2:
            [cell configureCellOfDescription:_testDetailItemData.cChoice withNSIndexPath:flIndexPath];
            break;
        case 3:
            [cell configureCellOfDescription:_testDetailItemData.dChoice withNSIndexPath:flIndexPath];
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
    NSInteger score = [self getScoreByFLIndexPath:_indexpaths];
    [result deliverGradeScore:score withTitle:self.paramTitle];
    [self.navigationController pushViewController:result animated:true];
}

//这里对内容进行调整
- (void)hasClickedCellBtnIndex:(FLIndexPath *)indexpath{
    [self adaptIndexPath:indexpath];
}

- (void)adaptIndexPath:(FLIndexPath*)indexPath{
    
    NSInteger section = indexPath.indexPath.section;
    NSInteger row = indexPath.indexPath.row;
    
    for (NSInteger index =0; index < _indexpaths.count ; index++) {
        FLIndexPath *indexp = _indexpaths[index];
        if (section == indexp.indexPath.section) {
            if (row == indexp.indexPath.row) {
                indexp.hasChoice = true;
            }else{
                indexp.hasChoice = false;
            }
            [_indexpaths setObject:indexp atIndexedSubscript:index];
        }
    }
    [self.tableView reloadData];
}

- (BOOL)isHasTarget:(NSIndexPath*)indexPath{
    for (FLIndexPath *indexp in _indexpaths) {
        if ((indexp.indexPath.section == indexPath.section) && (indexp.indexPath.row == indexPath.row )){
            return true;
        }
    }
    return false;
}

- (FLIndexPath*)getTarget:(NSIndexPath*)indexPath{
    for (FLIndexPath *indexp in _indexpaths) {
        if ((indexp.indexPath.section == indexPath.section) && (indexp.indexPath.row == indexPath.row )){
            return indexp;
        }
    }
    return [FLIndexPath new];
}


- (NSInteger)getScoreByFLIndexPath:( NSMutableArray<FLIndexPath>*)indexPaths{
    NSInteger score = 0;
    for (FLIndexPath *indexp in indexPaths) {
        if (indexp.hasChoice == true) {
            score += indexp.indexPath.row;
        }
    }
    return score;
}

@end
