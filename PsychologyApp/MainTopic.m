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
#import "CreateTopic.h"
#import "TopicComment.h"
#import "ServiceManager.h"
#import "VCToast.h"

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
//    [self loadDataAtInitState];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
    
    double time = [_topicItemData.time doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
//    这里可以优化
    CGFloat cellHeight = [cell setHeaderImageViewText:_topicItemData.headerImageUrl withTittleText:_topicItemData.owner withTimeText:[NSString stringWithFormat:@"%@",date] withMainTopicText:_topicItemData.theme  withLocationText:_topicItemData.location withPriceBtn:_topicItemData.praiseNum withCommentsIndex:_topicItemData.topic_id];
    _cellHeight = cellHeight;
    cell.mainCellDelegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicComment * comment = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:@"TopicComment"];
    comment.personServiceData = _tmpServiceData[indexPath.row];
    [self.navigationController pushViewController:comment animated:true];
}

- (IBAction)onCreateTopicClicked:(id)sender {
    NSLog(@"创建话题");
//
    CreateTopic *newTopic = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CreateTopic class])];
    [self.navigationController pushViewController:newTopic animated:true];
}

- (void)hasCommentClicked:(NSInteger)commentIndex{
//    topic_id 和indexpath.orw 并不是一一对应的
    NSInteger index ;
    TopicItemServiceData* itemData = [TopicItemServiceData new];
    for (index = _topicData.number-1 ; index >= 0; index--) {
        itemData = _tmpServiceData[index];
        if (itemData.topic_id == commentIndex) {
            break;
        }
    }
    [self tableView:self.mainTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
}

- (void)hasPraseClicked:(NSInteger) praseNumber withTopic_id:(NSInteger)topic_id{

    //界面已经处理，就是对数据的存储了，也就是对数据库的更新
    //这个就是点赞的内容

    [OBTAIN_SERVICE(TopicService) requestUPdatePraiseNumWithTopic_id:topic_id withPraiseNum:praseNumber WithComplete:^(TopicPraiseNumServiceData *servicTeData, NSError *error) {
        if (error.code != 0) {
            return ;
        }
        [[VCToast make:@"谢谢点赞"] show];
    }];
}

//返回来后者怎么样都是可以进行的

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
