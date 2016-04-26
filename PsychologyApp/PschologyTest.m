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
@property (nonatomic,strong) PschologyTestServiceData * psychologyTestData;
@end

@implementation PschologyTest

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PschologyTestCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([PschologyTestCell class])];

//    [self loadTestCellData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadTestCellData];
}

- (void)loadTestCellData{
    
    [OBTAIN_SERVICE(HomePageService) requestfromViewControllerPsychologyTest:^(PschologyTestServiceData *serviceData, NSError *error) {
        if (error.code != 0) {
            NSLog(@"网络或者解析出现错误");
            return ;
        }
        self.psychologyTestData = serviceData;
        [self.tableView reloadData];
    }];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.psychologyTestData.item.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PschologyTestCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PschologyTestCell class]) forIndexPath:indexPath];
    
    NSString * headerImageText = [(PschologyTestItem_ServiceData*)self.psychologyTestData.item[indexPath.row] header_image ];
    
    NSString *title = [(PschologyTestItem_ServiceData*)self.psychologyTestData.item[indexPath.row] title ];
    NSInteger testNum = [(PschologyTestItem_ServiceData*)self.psychologyTestData.item[indexPath.row] test_number];
    NSInteger commentNum = [(PschologyTestItem_ServiceData*)self.psychologyTestData.item[indexPath.row] comment_number];
    
    [cell setHeaderImageView:headerImageText withTittleLabel:title withTestImageView:@"icon_test" withTestNumberLabel:[NSString stringWithFormat:@"%ld",testNum] withCommentImageView:@"icon_comments" withCommentNumberLabelText:[NSString stringWithFormat:@"%ld",commentNum]];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PschologyTestSummary *testSummary = [[UIStoryboard storyboardWithName:@"HomePage" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PschologyTestSummary class])];
    
    NSString *title = [(PschologyTestItem_ServiceData*)self.psychologyTestData.item[indexPath.row] title ];
    [testSummary setHeaderTitleLabelWithText:title];
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
