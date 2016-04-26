//
//  PschologyTestResult.m
//  PsychologyApp
//
//  Created by felix on 16/4/23.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "PschologyTestResult.h"
#import "ServiceManager.h"


@interface PschologyTestResult ()
{
    NSInteger _gradeScore;
    NSString* _title;
}

@property (weak, nonatomic) IBOutlet UILabel *resultTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@end

@implementation PschologyTestResult

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadData];
}

- (void)deliverGradeScore:(NSInteger)score withTitle:(NSString *)title{
    _gradeScore = score;
    _title = title;
}

- (void)loadData{
//    [OBTAIN_SERVICE(HomePageService) requestResultWithtitle:@"亲少年心理问题" WithComplete:^(PschologyTestResultServiceData *serviceData, NSError *error) {
//        self.resultTitleLabel.text = serviceData.result_title;
//        self.resultTextView.text = serviceData.result_text;
//    }];
    
    [OBTAIN_SERVICE(HomePageService) requestScoreResultByTitle:_title WithComplete:^(PschologyScoreResultServiceData *serviceData, NSError *error) {
        
        if (error!= nil) {
            return ;
        }
     NSString *result = [self getResutlByScore:_gradeScore withScoreResultServiceData:serviceData];
        self.resultTextView.text = result;
        self.resultTitleLabel.text = [self getTitleByScore:_gradeScore];
    }];
}

- (IBAction)onTapGestureClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (NSString*)getResutlByScore:(NSInteger)score withScoreResultServiceData:(PschologyScoreResultServiceData*)serivceData{
    NSString *result ;
    switch (score) {
        case 0:
          result = serivceData.grade0;
            break;
        case 1:
            result = serivceData.grade1;
            break;
        case 2:
            result = serivceData.grade2;
            break;
        case 3:
            result = serivceData.grade3;
            break;
        case 4:
            result = serivceData.grade4;
            break;
        case 5:
            result = serivceData.grade5;
            break;
        case 6:
            result = serivceData.grade6;
            break;
        default:
            break;
    }
    return result;
}

- (NSString*)getTitleByScore:(NSInteger)score{
    NSString *title ;
    switch (score) {
        case 0:
            title = @"等级0";
            break;
        case 1:
            title = @"等级1";
            break;
        case 2:
            title = @"等级2";
            break;
        case 3:
            title = @"等级3";
            break;
        case 4:
            title = @"等级4";
            break;
        case 5:
            title = @"等级5";
            break;
        case 6:
            title = @"等级6";
            break;
        default:
            break;
    }
    return title;
}

@end
