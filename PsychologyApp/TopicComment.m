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


@interface TopicComment ()<UITableViewDelegate,UITableViewDataSource,CommentToBottomViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@property (weak, nonatomic) IBOutlet UIImageView *ownerHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *ownerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentBottomToViewConstraint;

@end

@implementation TopicComment

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitVariableAtInitstate];
    
    [self loadDataAtInitState];
    
}


- (void)setInitVariableAtInitstate{
    
// 注册nib的cell
    [self.commentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CommentsCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CommentsCell class])];
    
//  comments owenr's information
    [self.ownerHeaderImageView sd_setImageWithURL:[NSURL URLWithString:self.personServiceData.headerImageUrl] placeholderImage:[UIImage imageNamed:@"imageback"]];
    self.ownerNameLabel.text = self.personServiceData.owner;
    self.timeLabel.text = self.personServiceData.time;
    self.themeLabel.text = self.personServiceData.theme;
    self.locationLabel.text = self.personServiceData.location;

// 注册键盘监听
    [self registerForKeyboardNotifications];
    
//    first time load datas
    [self loadDataAtInitState];
}

- (void)loadDataAtInitState{
    NSLog(@"topic_id:%ld",(long)_personServiceData.topic_id);
    
    [OBTAIN_SERVICE(TopicService) requestCommentsOfTopic:_personServiceData.topic_id WithComplete:^(CommentsServiceData *servicTeData, NSError *error) {

    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.commentTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentsCell class]) forIndexPath:indexPath];
    cell.commentsLabel.text = @"有关的评论";
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
     *  话题的id，评论，test topic_id = 14 commentText = hello
     */
    
    [OBTAIN_SERVICE(TopicService) requestCommentSending:14 withComment:textviewText WithComplete:^(CommentSendingServiceData *servicTeData, NSError *error) {
        
        if ( error.code != 0 ) {
            [[VCToast make:@"木有网络咯"] show];
            return ;
        }
        NSLog(@"%ld",(long)servicTeData.ret);
    }];
    
}

@end
