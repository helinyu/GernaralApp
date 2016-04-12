//
//  TopicComment.m
//  PsychologyApp
//
//  Created by felix on 16/4/10.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "TopicComment.h"
#import "CommentsCell.h"

@interface TopicComment ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@end

@implementation TopicComment

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)setInitVariableAtInitstate{
    
// 注册nib的cell
    [self.commentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CommentsCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CommentsCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentsCell class]) forIndexPath:indexPath];
    
    return cell;
}


@end
