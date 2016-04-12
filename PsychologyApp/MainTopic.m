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
#import "ServiceManager.h"

@interface MainTopic ()<UITableViewDataSource,UITableViewDelegate,QAMainCellDelegate>
{
       CGFloat _cellHeight;
    TopicServiceData *_topicData ;
    NSMutableArray<TopicItemServiceData> *_tmpServiceData ;
    TopicItemServiceData *_topicItemData;
}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation MainTopic

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setInitVariable];
    [self loadDataAtInitState];
}

- (void)setInitVariable{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _topicData = [TopicServiceData new];
    _tmpServiceData = (NSMutableArray<TopicItemServiceData>*)[NSMutableArray new];
    _topicItemData = [TopicItemServiceData new];
    
    //注册tableViewcell
    [self.mainTableView registerNib:[UINib nibWithNibName:NSStringFromClass([QAMainCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([QAMainCell class])];
    
//    self.mainTableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(doSomethings)];
}

- (void)loadDataAtInitState{
    [OBTAIN_SERVICE(TopicService) requestTopicsWithComplete:^(TopicServiceData *servicTeData, NSError *error) {
        
        if (error.code != 0) {
            printf("数据转化出现错误");
            return ;
        }
         _topicData = servicTeData;
        
        [self.mainTableView reloadData];
    }];
}

- (void)doSomethings{
    NSLog(@"doSomethings");
}

#pragma mark --tableDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _topicData.number;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QAMainCell class]) forIndexPath:indexPath];
    _tmpServiceData = _topicData.topics;
    _topicItemData = _tmpServiceData[indexPath.row];
    
//    这里可以优化
//    CGFloat cellHeight = [cell setHeaderImageViewText:_topicItemData.headerImageUrl withTittleText:_topicItemData.owner withTimeText:_topicItemData.time withMainTopicText:_topicItemData.theme withLocationText:_topicItemData.location withPriceBtn:_topicItemData.praiseNum withComments:_topicItemData.commentsNum withCommentIndex:_topicItemData.topic_id];
    CGFloat cellHeight = [cell setHeaderImageViewText:_topicItemData.headerImageUrl withTittleText:_topicItemData.owner withTimeText:_topicItemData.time withMainTopicText:_topicItemData.theme  withLocationText:_topicItemData.location withPriceBtn:_topicItemData.praiseNum withComments:_topicItemData.commentsNum withCommentsIndex:_topicItemData.topic_id];
    _cellHeight = cellHeight;
    cell.mainCellDelegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    TopicDetail *td = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([TopicDetail class])];
//    [self.navigationController pushViewController:td animated:true];
    
    TopicComment * cell = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:@"TopicComment"];
//    _topicItemData = _tmpServiceData[]
    [self.navigationController pushViewController:cell animated:true];
}

- (IBAction)onCreateTopicClicked:(id)sender {
    NSLog(@"创建话题");
//    BbsArticleRead 闺蜜圈
    CreateTopic *newTopic = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CreateTopic class])];
    [self.navigationController pushViewController:newTopic animated:true];
}

- (void)hasCommentClicked:(NSInteger)commentIndex{
    [self tableView:self.mainTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:commentIndex inSection:0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
