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
#import "ServiceManager.h"
#import "Helper+App.h"
#import "VCAlertView.h"
#import "VCToast.h"
#import "NSString+plist.h"
#import "AccountLogin.h"

#define From_Time @"From_Time"
#define To_time @"To_Time"

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
    
    
    // 查看switch是否是开启的
    [self correctWakeUpSwitch];
}

//更正switchon 按钮
- (void)correctWakeUpSwitch{
    BOOL switchOn = [NSString getAttribute_PlistWithKeyWord:SWITCH_ON withFileName:ATTRIBUTE];
    if (switchOn != self.wakeUpSwitch.on) {
        [NSString setAttributeForKeyword:SWITCH_ON withValue:[NSString stringWithFormat:@"%d",self.wakeUpSwitch.on] withFileName:ATTRIBUTE];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.timeBeingLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:From_Time];
    self.timeToLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:To_time];
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
//    [self.navigationController popToRootViewControllerAnimated:true];
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Account" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([AccountLogin class]) ] animated:true];
}

- (IBAction)onCheckUpUPdateClicked:(id)sender {
    NSLog(@"检查更新");
    
}

- (IBAction)onWakeUpSwitchClicked:(id)sender {
    UISwitch *switchTime = (UISwitch*)sender;
    NSLog(@"%d",switchTime.on);
    [NSString setAttributeForKeyword:SWITCH_ON withValue:[NSString stringWithFormat:@"%d",switchTime.on] withFileName:ATTRIBUTE];
}

- (IBAction)onTimeBeginClicked:(id)sender {
    FLDatePicker *picker = [FLDatePicker makeWithTitle:@"标题"];
    [picker showInView:self.view withConfirm:^(NSDate *date, NSInteger index) {
        NSLog(@"date is ;%@",date);
        self.timeBeingLabel.text = [date dateToStringDisplayHourMinuteSecond];
        [[NSUserDefaults standardUserDefaults] setObject:self.timeBeingLabel.text forKey:From_Time];
    }];
}
- (IBAction)onTimeToClicked:(id)sender {
    FLDatePicker *picker = [FLDatePicker makeWithTitle:@"标题"];
    [picker showInView:self.view withConfirm:^(NSDate *date, NSInteger index) {
        NSLog(@"date is ;%@",date);
        self.timeToLabel.text = [date dateToStringDisplayHourMinuteSecond];
        [[NSUserDefaults standardUserDefaults] setObject:self.timeToLabel.text forKey:To_time];
    }];
}

- (IBAction)onCheckUpdateClicked:(id)sender {
    NSLog(@"更新");    
    [OBTAIN_SERVICE(SettingService) requestUpdate:^(SettingServiceData *serviceData, NSError *error) {
        NSLog(@"servidata version is ; %@",serviceData.version);
        
        NSString *localVersion = [Helper getAppVersion];
        NSString *latestversion = serviceData.version;
        
        if ( [localVersion compare:latestversion options:NSNumericSearch] == NSOrderedAscending) {
            NSString *upgradeTitle = [NSString stringWithFormat:@"发现新版本(%@)", latestversion];            
            [[VCAlertView new] showWithTitle:upgradeTitle message:@"升级提示" cancelButtonTitle:@"取消" otherButtonTitle:@"立刻升级" tapBlock:^(NSInteger buttonIndex) {
                if (buttonIndex == 0) {
                    [[VCToast make:@"取消升级"] show];
                } else if (buttonIndex == 1) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:serviceData.url]];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/cn/app/jie-zou-da-shi/id493901993?mt=8"]];
                }
            }];
        }else{
            [[VCToast make:@"暂时没有更新"] show];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
