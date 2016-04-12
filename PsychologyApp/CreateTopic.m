//
//  CreateTopic.m
//  PsychologyApp
//
//  Created by felix on 16/4/10.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "CreateTopic.h"
#import "ServiceManager.h"
#import "VCToast.h"

@interface CreateTopic ()

@end

@implementation CreateTopic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


- (void)createTopicWithTheme:(NSString*)theme  withOwner:(NSString *)owner withLocation:(NSString *)location withPraiseNum:(NSInteger )praiseNum withCommentNum:(NSInteger)commentNum withTime:(NSString*)time withHeaderImageUrl:(NSString*)headerImageUrl {
    
    [OBTAIN_SERVICE(TopicService) requestCreateComments:theme withOwner:owner withLocation:location withPraiseNum:praiseNum withCommentsNum:commentNum withTime:time withHeaderImageUrl:headerImageUrl WithComplete:^(CommentsCreationServiceData *servicTeData, NSError *error) {
        if (error.code != 0) {
            [[VCToast make:@"木有网络哦"] show];
            return ;
        }
        
        [[VCToast make:@"创建话题成功"] show];
        [self.navigationController popViewControllerAnimated:true];
    }];
}

- (IBAction)onCreateTopicClicked:(id)sender {
    
    [self createTopicWithTheme:@"话题_guanyu" withOwner:@"何林郁" withLocation:@"深圳" withPraiseNum:2 withCommentNum:3 withTime:@"上午8点" withHeaderImageUrl:@"http://www.baidu.com"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
