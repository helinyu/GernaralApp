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

@interface TopicComment ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@property (weak, nonatomic) IBOutlet UIImageView *ownerHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *ownerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@end

@implementation TopicComment

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setInitVariableAtInitstate];
    
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

    
//    first time load datas
    [self loadDataAtInitState];
}

- (void)loadDataAtInitState{
    NSLog(@"初始化加载数据");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.commentTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentsCell class]) forIndexPath:indexPath];
    cell.commentsLabel.text = @"有关的评论";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


@end
