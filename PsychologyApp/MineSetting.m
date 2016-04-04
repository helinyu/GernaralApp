//
//  CommonSetting.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineSetting.h"
#import "Helper+App.m"
#import "FLDatePicker.h"
#import "NSDate+NSString.h"
#import "AppDefinition.h"
#import "Model.h"

@interface MineSetting ()
{
    BOOL _isLogined;
}
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UIButton *signOutBtn;

@property (weak, nonatomic) IBOutlet UILabel *timeBeingLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeToLabel;

@property (weak, nonatomic) IBOutlet UISwitch *wakeUpSwitch;

@end

@implementation MineSetting

- (void)viewDidLoad {
    [super viewDidLoad];
    self.versionLabel.text = [Helper getAppVersion];
      _isLogined =[[NSUserDefaults standardUserDefaults] boolForKey:IS_LOGINED] ;
    [self configureSignOutBtn:_isLogined];
    
}

- (void)configureSignOutBtn:(BOOL)flag{
    if (flag == true) {
        self.signOutBtn.enabled = true;
    }else{
        self.signOutBtn.enabled = false ;
    }
}

- (IBAction)onBackBarButtonItemClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onSignOutClicked:(id)sender {
    NSLog(@"signout");
//    清除缓存，以及设数据库  只是处理了isLogined
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:IS_LOGINED];
//  更新数据库
    NSString *phone = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_PHONE];
    EntityUser *user = [[Model sharedInstance] loadUseByUId:phone];
    user.isLogined = false ;
    [[Model sharedInstance] commitUser];
    
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (IBAction)onCheckUpUPdateClicked:(id)sender {
    NSLog(@"检查更新");
}

- (IBAction)onWakeUpSwitchClicked:(id)sender {
    UISwitch *switchTime = (UISwitch*)sender;
    NSLog(@"%d",switchTime.on);
}

- (IBAction)onTimeBeginClicked:(id)sender {
    FLDatePicker *picker = [FLDatePicker makeWithTitle:@"标题"];
    [picker showInView:self.view withConfirm:^(NSDate *date, NSInteger index) {
        NSLog(@"date is ;%@",date);
        self.timeBeingLabel.text = [date dateToStringDisplayHourMinuteSecond];
    }];
}
- (IBAction)onTimeToClicked:(id)sender {
    FLDatePicker *picker = [FLDatePicker makeWithTitle:@"标题"];
    [picker showInView:self.view withConfirm:^(NSDate *date, NSInteger index) {
        NSLog(@"date is ;%@",date);
        self.timeToLabel.text = [date dateToStringDisplayHourMinuteSecond];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
