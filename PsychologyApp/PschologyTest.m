//
//  PschologyTest.m
//  PsychologyApp
//
//  Created by felix on 16/3/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTest.h"
#import "PschologyTestCell.h"
#import "PschologyTestSummary.h"
#import "ServiceManager.h"

@interface PschologyTest ()

@end

@implementation PschologyTest

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PschologyTestCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PschologyTestCell class])];
    
    [self loadTestCellData];
    
}

- (void)loadTestCellData{
    [OBTAIN_SERVICE(HomePageService) requestfromViewControllerPsychologyTest:^(NSString *imageUrl, NSString *testTitle, NSInteger testNumber, NSInteger commentNumber) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PschologyTestCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PschologyTestCell class]) forIndexPath:indexPath];
    [cell setHeaderImageView:@"icon_test_header" withTittleLabel:@"标题" withTestImageView:@"icon_test" withTestNumberLabel:@"测评人数" withCommentImageView:@"icon_comments" withCommentNumberLabelText:@"评价人数"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PschologyTestSummary *testSummary = [[UIStoryboard storyboardWithName:@"HomePage" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PschologyTestSummary class])];
    [testSummary setHeaderTitleLabelWithText:@"标题值传入"];
    [self.navigationController pushViewController:testSummary animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
