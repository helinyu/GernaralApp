//
//  MainConsult.m
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MainConsult.h"
#import "ReadingTitleLabelCell.h"
#import "ConsultMainSummarizeCell.h"

typedef NS_ENUM(NSInteger, TopicType) {
    TopicType1 = 0,
    TopicType2
};

@interface MainConsult () <UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _hotTopicIndex;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *titleswitchControl;
@property (weak, nonatomic) IBOutlet UITableView *consultMianSummarizeTableView;
@property (weak, nonatomic) IBOutlet UIButton *hotTopicButton;
@property (weak, nonatomic) IBOutlet UIButton *newestTopicButton;

@end

@implementation MainConsult

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tableView 注册cell  r热门话题
    [self.consultMianSummarizeTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ConsultMainSummarizeCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ConsultMainSummarizeCell class])];
    
//    最新话题

    //默认的类型
    _hotTopicIndex = TopicType1;

}

#pragma mark --UItableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger number;
    
    switch (_hotTopicIndex) {
        case TopicType1:
            number = 10;
            break;
        case TopicType2:
            number = 5;
            break;
        default:
            break;
    }
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cellT;
    
    switch (_hotTopicIndex) {
        case TopicType1:
        {
            ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConsultMainSummarizeCell class]) forIndexPath:indexPath];
            
            [cell setBackgroundImageView:@"4.jpg" withPersonHeadImageView:@"portrait_head" withPersonNameLabel:@"何林郁" withPersonSummarizeLabel:@"单亲父母应该怎么处理孩子青春期的问题" withConsultNumerLabel:1];
            cellT = cell;

        }
            break;
            
        case TopicType2:
        {
            ConsultMainSummarizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConsultMainSummarizeCell class]) forIndexPath:indexPath];
            
            [cell setBackgroundImageView:@"4.jpg" withPersonHeadImageView:@"portrait_head" withPersonNameLabel:@"何林郁" withPersonSummarizeLabel:@"单亲父母应该怎么处理孩子青春期的问题" withConsultNumerLabel:1];
            cellT = cell;
            
        }
            break;
            
              default:
            break;
    }
    return cellT;
}

- (IBAction)onChangeHopTopicClicked:(id)sender {
    NSLog(@"切换了按钮");
    
    UIButton *button = (UIButton*)sender ;
    
    switch (button.tag-20) {
        case TopicType1:
            _hotTopicIndex = TopicType1;
            break;
        case TopicType2:
            _hotTopicIndex = TopicType2;
            break;
        default:
            break;
    }
    [self.consultMianSummarizeTableView setNeedsDisplay];
    [self.consultMianSummarizeTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
