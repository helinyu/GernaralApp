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
#import "MineComments.h"
#import "MineShareFriend.h"
#import "MineEditProfile.h"
#import "MineConsultingexpert.h"
#import "MineCollection.h"
#import "MineComments.h"
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

#define Header_Image @"Header_Image.png"

@interface MineController ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationBarDelegate>
{
    NSArray *_arrays;
    NSArray *_pictures;
    NSString *_cacheStr;
    BOOL _isLogined;
}
@property (weak, nonatomic) IBOutlet UILabel *loginUserLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@end

@implementation MineController

- (void)viewDidLoad{
    
    _arrays = @[
               @[@"我的评论"],
               @[@"编辑资料"],
               @[@"反馈意见",@"设置",@"缓存了 0.0MB"]
               ];

    _pictures = @[
                  @[@"icon_timeOfAppointment"],
                  @[@"Editing"],
                  @[@"Editing",@"setting",@"clear_trash"]
                  ];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchNotificationByRegister:) name:REGISTER_PHONE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchNotificationByLogin:) name:LOGIN_PHONE object:nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
   
    NSString* imagePath = [[self documentFolderPath] stringByAppendingPathComponent:Header_Image];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
        self.headerImageView.image = [UIImage imageNamed:imagePath];
    }else{
        self.headerImageView.image = [UIImage imageNamed:@"icon_mine_default_header_protriat"];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _cacheStr = [NSString stringWithFormat:@"缓存了 %1.1fMB",[self checkCacheImageSize]];
    [self.tableView reloadData];
    [self isLogined];
}

- (void)isLogined{
    //数据处理
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

    [cell cellWithImage:[UIImage imageNamed:_pictures[indexPath.section][indexPath.row]] andGeneralizatonWithtext:_arrays[indexPath.section][indexPath.row]];
    if ((indexPath.section == 2) && (indexPath.row == 2)) {
        [cell cellWithImage:[UIImage imageNamed:_pictures[indexPath.section][indexPath.row]] andGeneralizatonWithtext:_cacheStr];
    }
    return cell;
}

#pragma mark --tableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:{
                    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MineComments class])] animated:YES];
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
                    if ([_cacheStr isEqualToString:@"缓存了 0.0MB"]) {
                        [[VCToast make:@"现在没有缓存,不用清理哦"] show];
                        return;
                    }
                   [[VCAlertView new] showWithTitle:@"提示" message:@"清除缓存？" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" tapBlock:^(NSInteger buttonIndex) {
                       if (buttonIndex == 0) {
                           return ;
                       }else{
                           [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
                               [[VCToast make:@"已经清空所有缓存"] show];
                               _cacheStr = @"缓存了 0.0MB";
                               [self.tableView reloadData];
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
     NSLog(@"切换图片");
    [self addImageAndConfigureButton:(UIButton*)sender];
}


- (CGFloat)checkCacheImageSize{
    CGFloat size = ([[SDImageCache sharedImageCache] getSize] /1024.0 )/1024.0 ;
    return size;
}

//图片处理
- (void)addImageAndConfigureButton:(UIButton*)button{
    
    //    增加图片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.editing = true;
    [self presentViewController:picker animated:true completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    self.headerImageView.image = image;
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.headerImageView.image = image;
//    [[NSUserDefaults standardUserDefaults] setObject:image forKey:Header_Image];

    [self saveImage:image WithName:Header_Image];
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
}

- (NSString *)documentFolderPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

@end
