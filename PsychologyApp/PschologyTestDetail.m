//
//  PschologyTestDetail.m
//  PsychologyApp
//
//  Created by felix on 16/3/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTestDetail.h"
#import "ServiceManager.h"


#define NUMBERLABEL_OF_DETAIL 4

@interface PschologyTestDetail ()

@property (strong,nonatomic) PschologyTestDetail_ServiceData *testDetailData;
@property (strong,nonatomic) PschologyTestDetailItem_ServiceData *testDetailItemData;

@end


@implementation PschologyTestDetail


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadTestData];
    self.navigationItem.title = @"测试";
}

- (void)loadTestData{
    
    [OBTAIN_SERVICE(HomePageService) requestfromViewControllerPschologyTestDetail:self.paramTitle andComplete:^(PschologyTestDetail_ServiceData *serviceData, NSError *error) {
        _testDetailData = [PschologyTestDetail_ServiceData new];
        _testDetailItemData = [PschologyTestDetailItem_ServiceData new];
        _testDetailData = (PschologyTestDetail_ServiceData*)serviceData;
        [self.tableView reloadData];
        [self.tableView layoutIfNeeded];
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
    [title appendString:@"   题目:"];
    [title appendString:_testDetailItemData.title];
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _testDetailItemData = _testDetailData.dataItem[indexPath.section] ;
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSMutableString *cellLabelStr = [NSMutableString new ];
    switch (indexPath.row) {
        case 0:
            [cellLabelStr appendString:@"A:"];
            [cellLabelStr appendString: [_testDetailItemData aChoice]];
            break;
        case 1:
            [cellLabelStr appendString:@"B:"];
            [cellLabelStr appendString:[_testDetailItemData bChoice]];
            break;
        case 2:
            [cellLabelStr appendString:@"C:"];
            [cellLabelStr appendString:[_testDetailItemData cChoice]];
            break;
        case 3:
            [cellLabelStr appendString:@"D:"];
            [cellLabelStr appendString:[_testDetailItemData dChoice]];
            break;
        default:
            break;
    }
    
    cell.textLabel.text = cellLabelStr;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (IBAction)onComputeClicked:(id)sender {
    
    
    
    NSLog(@"查询结果");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//http://localhost/foreheard/homePage/psychology_test/fetch_Pschology_detail.php

@end
