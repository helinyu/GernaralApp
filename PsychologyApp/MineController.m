//
//  MineController.m
//  PsychologyApp
//
//  Created by felix on 16/1/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineController.h"
#import "FLTableViewCell.h"
#import "AccountLogin.h"
#import "MineSetting.h"
#import "MineFeedback.h"
#import "MineShareFriend.h"
#import "MineAttentionOrFan.h"
#import "MineEditProfile.h"
#import "MineConsultingexpert.h"
#import "MineCollection.h"
#import "MineTest.h"
#import "MineQA.h"
#import "MineArticle.h"
#import "MineBookingManagement.h"
#import "MineMessageCenter.h"
#import "AppDefinition.h"
#import "Model.h"
#import "VCAlertView.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "VCToast.h"

#define EditProfileIndexPathSection 1
#define EditProfileIndexPathRow 0

@interface MineController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_arrays;
    BOOL _isLogined;
}
@property (weak, nonatomic) IBOutlet UILabel *loginUserLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@end

@implementation MineController


- (void)viewDidLoad{
    _arrays = @[
               @[@"测试"],
               @[@"编辑资料"],
               @[@"反馈意见",@"设置",@"清除缓存"]
               ];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchNotificationByRegister:) name:REGISTER_PHONE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchNotificationByLogin:) name:LOGIN_PHONE object:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self isLogined];
}

- (void)isLogined{
    //    数据处理
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* userId =  [userDefaults objectForKey:LOGIN_PHONE];
    //数据的处理
    Model *model = [Model sharedInstance];
    EntityUser *user = [model loadUseByUId:userId];
    _isLogined  = user.isLogined;

    [userDefaults setBool:_isLogined forKey:IS_LOGINED];
    [userDefaults synchronize];

    if (_isLogined == true) {
        self.loginUserLabel.text = user.uId ;
    }else{
        self.loginUserLabel.text = @"请登录";
        AccountLogin *login  = [[UIStoryboard storyboardWithName:@"Account" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([AccountLogin class])];
        [self.navigationController pushViewController:login animated:true];
    }
}

-  (void)fetchNotificationByRegister:(NSNotification*)notification{
    self.loginUserLabel.text = [notification.userInfo objectForKey:REGISTER_PHONE];
}

-  (void)fetchNotificationByLogin:(NSNotification*)notification{
    self.loginUserLabel.text = [notification.userInfo objectForKey:LOGIN_PHONE];
}


#pragma mark --tableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrays[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrays.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FLTableViewCell class]) forIndexPath:indexPath];
    
    [cell cellWithImage:[UIImage imageNamed:@"icon_timeOfAppointment"] andGeneralizatonWithtext:_arrays[indexPath.section][indexPath.row]];
    
    return cell;
}

#pragma mark --tableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineTest class])] animated:YES];
                    break;
                }
                    
                default:
                    break;
            }
            break;
            
        case 1:
            switch (indexPath.row) {
                case 0:{
                    MineEditProfile *profile = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineEditProfile class])];
                    
                    [profile setHeaderName:self.loginUserLabel.text withHeaderImage:self.headerImageView.image];
                    
                    [self.navigationController pushViewController:profile animated:true];
                   
                    break;
                }
                default:
                    break;
            }
            break;
            
        case 2:
            switch (indexPath.row) {
                case 0:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineFeedback class])] animated:YES];
                    break;
                }

                case 1:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineSetting class])] animated:YES];
                    break;
                }
                case 2:{
                    NSLog(@"清除缓存");
                    
                   [[VCAlertView new] showWithTitle:@"提示" message:@"清除缓存？" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" tapBlock:^(NSInteger buttonIndex) {
                       
                       if (buttonIndex == 0) {
                           return ;
                       }else{
                           [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                               [[VCToast make:@"已经清空所有缓存"] show];
                           }];
                       }
                   }];
                }
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

- (IBAction)onAccountLoginTap:(id)sender {
    
    
    if ( _isLogined == true) {
        [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:EditProfileIndexPathRow inSection:EditProfileIndexPathSection]];
        return ;
    }
    AccountLogin *accountLogin = [[UIStoryboard storyboardWithName:@"Account" bundle:nil]instantiateViewControllerWithIdentifier:NSStringFromClass([AccountLogin class])];
    [self.navigationController pushViewController:accountLogin animated:YES];
}


@end
