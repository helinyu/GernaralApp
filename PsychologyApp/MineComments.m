//
//  MineTest.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineComments.h"
#import "ServiceManager.h"
#import "TopicComment.h"

@interface MineComments ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *comments;
@property (nonatomic,assign) NSInteger comments_Number;

@property (nonatomic,strong) NSMutableArray *topicIds;
@property (nonatomic,assign) NSInteger topicIds_Number;

@property (nonatomic,strong) CommentsOfTopicServiceData* commentsServiceData;
@property (nonatomic,strong) NSMutableArray<CommentsOfTopicItemServiceData>* itemCommentsServiceDatas;
@property (nonatomic,assign) NSInteger commentNum;
@property (nonatomic,strong) NSMutableArray* topic_ids;

@property (nonatomic,strong) TopicServiceData *topicsServiceData;
@property (nonatomic,strong) NSMutableArray<TopicItemServiceData>* itemTopicServiceDatas;
@property (nonatomic,assign) NSInteger topicNum;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation MineComments

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitVariables];
    [self requestMyCommentOfAllTopic:[[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_PHONE]];
}
     
- (void)setInitVariables{
    _topicIds = [NSMutableArray new];
    _comments = [NSMutableArray new];
    _commentsServiceData = [CommentsOfTopicServiceData new];
    _topicsServiceData = [TopicServiceData new];
    _topic_ids = [NSMutableArray new];
    self.tableview.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
}

- (void)requestMyCommentOfAllTopic:(NSString *)person_phone{
    [OBTAIN_SERVICE(MineService) requestMyCommnents:person_phone withComplete:^(CommentsOfTopicServiceData *serviceData, NSError *error) {
        NSLog(@"serviceData is ; %@",serviceData);
        _commentsServiceData = serviceData;
        _itemCommentsServiceDatas = serviceData.datas;
        _commentNum = serviceData.number;
        [self.tableview reloadData];
//        if (_commentNum != 0) {
////            [self removeDuplicateTopic_idOfComments];
////            [self requestTopicOfHasCommentByMe];
//        }else{
//            NSLog(@"没有数据");
//        }
    }];
}


- (void)requestTopicOfHasCommentByMe{
    
}
//判断有多少个内容，将从重复的去掉
- (void)removeDuplicateTopic_idOfComments{
    
    for (CommentsOfTopicItemServiceData *item in _itemCommentsServiceDatas) {
        
        if (_topicIds.count == 0) {
            [_topicIds addObject:@(item.topic_id)];
            continue;
        }
        
        BOOL hasResult = true;
        for (NSInteger  index =0 ; index<_topicIds.count; index++) {
            if ([@(item.topic_id) isEqual:_topicIds[index]]) {
                hasResult = true;
                break;
            }else{
                hasResult = false;
            }
        }
        if (hasResult == false) {
            [_topicIds addObject:@(item.topic_id)];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _commentNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellStr = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellStr];
    }
    CommentsOfTopicItemServiceData *itemServiceData = _itemCommentsServiceDatas[indexPath.row];
    cell.textLabel.text = itemServiceData.content;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    double dateInterval = [itemServiceData.time doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateInterval];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"评论时间：%@",date];
//    cell.bounds.size.width = [[UIScreen mainScreen] bounds].size.width;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
#warning 这里需要添加进去相关的网络请求直接复制到那边，这样达到统一
    
    TopicComment * comment = [[UIStoryboard storyboardWithName:@"Topic" bundle:nil] instantiateViewControllerWithIdentifier:@"TopicComment"];
//    comment.personServiceData = _itemCommentsServiceDatas[indexPath.row];[indexPath.row];
    [self.navigationController pushViewController:comment animated:true];
    
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
