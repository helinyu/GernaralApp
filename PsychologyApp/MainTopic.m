//
//  MainQA.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainTopic.h"
#import "QAMainCell.h"
#import "MJRefresh.h"
#import "TopicDetail.h"
#import "CreateTopic.h"
#import "TopicComment.h"

@interface MainTopic ()<UITableViewDataSource,UITableViewDelegate,QAMainCellDelegate>
{
       CGFloat _cellHeight;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation MainTopic

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setInitVariable];
}

- (void)setInitVariable{
    self.automaticallyAdjustsScrollViewInsets = NO;

    //注册tableViewcell
    [self.mainTableView registerNib:[UINib nibWithNibName:NSStringFromClass([QAMainCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QAMainCell class])];
    
    self.mainTableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(doSomethings)];
}

- (void)doSomethings{
    NSLog(@"doSomethings");
}
#pragma mark --tableDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QAMainCell class]) forIndexPath:indexPath];
    
    CGFloat cellHeight = [cell setHeaderImageViewText:@"flower_person" withTittleText:@"何林郁" withTimeText:@"上午9时" withMainTopicText:@"讨论的主题,讨论的主题讨论的主题讨论的主题讨论的主题" withLocationText:@"位置深圳" withPriceBtn:12 withComments:23];
    
    _cellHeight = cellHeight;
    
    cell.mainCellDelegate = self;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TopicDetail *td = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([TopicDetail class])];
    [self.navigationController pushViewController:td animated:true];
}

- (IBAction)onCreateTopicClicked:(id)sender {
    NSLog(@"创建话题");
//    BbsArticleRead 闺蜜圈
    CreateTopic *newTopic = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CreateTopic class])];
    [self.navigationController pushViewController:newTopic animated:true];
}

- (void)hasCommentClicked{
    TopicComment * cell = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:@"TopicComment"];
    [self.navigationController pushViewController:cell animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
