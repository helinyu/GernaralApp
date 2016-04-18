//
//  TopicComment.m
//  PsychologyApp
//
//  Created by felix on 16/4/10.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "TopicComment.h"
#import "CommentsCell.h"
#import "UIImageView+WebCache.h"
#import "CommentToBottomView.h"
#import "ServiceManager.h"
#import "VCToast.h"
#import "UIImageView+WebCache.h"

@interface TopicComment ()<UITableViewDelegate,UITableViewDataSource,CommentToBottomViewDelegate>
{
    CommentsOfTopicServiceData *_serviceData ;
    NSMutableArray<CommentsOfTopicItemServiceData> *_itemServiceDatas;
    NSInteger _commentNUm ;
}
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (weak, nonatomic) IBOutlet UIImageView *ownerHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *ownerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentBottomToViewConstraint;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;

@end

@implementation TopicComment

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitVariableAtInitstate];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.topicCommmetDelegate freshCommentsNumber:_commentNUm];
}


- (void)setInitVariableAtInitstate{
    
//    初始化数据源
    _serviceData = [CommentsOfTopicServiceData new];
    _itemServiceDatas = (NSMutableArray<CommentsOfTopicItemServiceData> *)[NSMutableArray new];
    
// 注册nib的cell
    [self.commentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CommentsCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CommentsCell class])];
    
//  comments owenr's information
    [self.ownerHeaderImageView sd_setImageWithURL:[NSURL URLWithString:self.personServiceData.headerImageUrl] placeholderImage:[UIImage imageNamed:Image_Default]];
    self.ownerNameLabel.text = self.personServiceData.owner;
    self.timeLabel.text = self.personServiceData.time;
    self.themeLabel.text = self.personServiceData.theme;
    self.locationLabel.text = self.personServiceData.location;

// 注册键盘监听
    [self registerForKeyboardNotifications];
}

- (void)loadDataAtInitState{
    NSLog(@"topic_id:%ld",(long)_personServiceData.topic_id);
    
    [OBTAIN_SERVICE(TopicService) requestCommentsOfTopic:_personServiceData.topic_id WithComplete:^(CommentsOfTopicServiceData *servicTeData, NSError *error) {
        NSLog(@"serviceDAta is : %@",servicTeData.description);
        _serviceData = servicTeData;
        _itemServiceDatas = servicTeData.datas;
        self.commentsLabel.text = [NSString stringWithFormat:@"    当前的评论数目:%ld",(long)servicTeData.number];
        _commentNUm = servicTeData.number;
        [self.commentTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadDataAtInitState];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _serviceData.number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentsCell class]) forIndexPath:indexPath];
    CommentsOfTopicItemServiceData *itemServiceData = _itemServiceDatas[indexPath.row];
    cell.commentsLabel.text = itemServiceData.content;
    [cell.headerImageview sd_setImageWithURL:[NSURL URLWithString:itemServiceData.headerImageUrl] placeholderImage:[UIImage imageNamed:Image_Default]];
//    这个东西应该需要进行修改
    cell.timeLabel.text = itemServiceData.time;
    cell.themeLabel.text = itemServiceData.person_phone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark -- keyword deal with
//注册监听键盘的显示和隐藏
- (void) registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

//键盘显示
- (void) keyboardWasShown:(NSNotification *) notif
{
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    self.commentBottomToViewConstraint.constant = keyboardSize.height;
}

//键盘隐藏

- (void) keyboardWasHidden:(NSNotification *) notif
{
    self.commentBottomToViewConstraint.constant = 0;
}

- (IBAction)onGestureClicked:(id)sender {
    [self.view endEditing:true];
}

//评论
-(void)deliverTextViewText:(NSString*) textviewText{
    NSLog(@"get text :%@",textviewText);
    /**
     *  话题的id，评论，test topic_id = 14 commentText = hello ,time ,headerImageUrl
     */
    
    [OBTAIN_SERVICE(TopicService) requestCommentSending:_personServiceData.topic_id withComment:textviewText withPerson_phone:_personServiceData.owner withHeaderImageUrl:_personServiceData.headerImageUrl withTime:_personServiceData.time WithComplete:^(CommentSendingServiceData *servicTeData, NSError *error) {
        if ( error.code != 0 ) {
            [[VCToast make:@"木有网络咯"] show];
            return ;
        }
        NSLog(@"%ld",(long)servicTeData.ret);
        [[VCToast make:@"评论成功"] show];
        [self loadDataAtInitState];
    }];
}

@end
