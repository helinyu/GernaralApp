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
#import "NSDate+NSString.h"
#import "LocationFetching.h"

#define InitPraiseNum 0
#define InitCommentNum 0

@interface CreateTopic ()<LocationFetchingDelegate>

@property (weak, nonatomic) IBOutlet UITextView *inputTopicTextView;
@property (nonatomic,strong) LocationFetching *locationFetching;
@property (nonatomic,strong) NSString *nowLocation;
@end

@implementation CreateTopic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationFetching = [LocationFetching new];
    self.locationFetching.locationDelegate = self;
    [self.locationFetching fillVariableAtInitState];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.locationFetching stopLocation];
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
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* userId =  [userDefaults objectForKey:LOGIN_PHONE];
    
    NSString *nowTime = [[NSDate new] dateOfNowToString];
    NSLog(@"nowTime isi :%@",nowTime);
    
    NSInteger nowTimeI = [[NSDate new] dateOfBeijingTime];
    NSString *nowTimeStr = [NSString stringWithFormat:@"%ld",(long)nowTimeI];
    
        [self createTopicWithTheme:self.inputTopicTextView.text withOwner:userId withLocation:self.nowLocation withPraiseNum:InitPraiseNum withCommentNum:InitCommentNum withTime:nowTimeStr withHeaderImageUrl:@"image_default"];
}


- (void)getBackLocationString:(NSString *)locationStr{
    if (locationStr == nil) {
        self.nowLocation =@"";
    }else{
        self.nowLocation = locationStr;
    }
}

- (void)getLatitude:(NSString *)latitude withLongitude:(NSString *)longitude withAltitude:(NSString *)altitude{
    //    NSLog(@"latitude is :%@",latitude);
    NSLog(@"latitude is : %@",latitude);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
