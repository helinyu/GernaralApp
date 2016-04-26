//
//  MineEditProfile.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineEditProfile.h"
#import "EditProfileCell.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ServiceManager.h"
#import "EditProfileServiceData.h"
#import "VCToast.h"

@interface MineEditProfile ()
{
    NSString *_personName;
    UIImage *_personImage;
    NSInteger _attributeCount;
    EditProfileServiceData *_profileValueS ;
}

@property (nonatomic,strong) NSArray *profiles;
@property (nonatomic,strong) NSMutableArray *profilesAttibutes;
@property (weak, nonatomic) IBOutlet UILabel *headerPersonNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personHeaderImageView;

@end

@implementation MineEditProfile

- (void)setHeaderName:(NSString *)name withHeaderImage:(UIImage*)image {
    _personName = name;
    _personImage = image ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _profileValueS = [EditProfileServiceData new];
    
    self.profiles = @[@"昵称:",@"密码:",@"性别:",@"年龄:",@"地区:",@"简介:"];
    _attributeCount = self.profiles.count;
    _profilesAttibutes = [NSMutableArray new];
    
//    请求数据
    [self loadEditProfile];
    
    self.personHeaderImageView.image = _personImage ;
    self.headerPersonNameLabel.text = _personName;
    
}

- (void)loadEditProfile{
    [OBTAIN_SERVICE(EditProfileService) requestEditProfie:_personName withComplete:^(EditProfileServiceData *serviceData, NSError *error) {
        _profileValueS = serviceData;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- 修改资料

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.profiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    EditProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EditProfileCell class]) forIndexPath:indexPath];
    cell.atrributeLabel.text = self.profiles[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
        {
            cell.valueTextField.text = _profileValueS.nickname;
        }
            break;
        case 1:
        {
            cell.valueTextField.text = _profileValueS.password ;
        }
            break;
        case 2:
        {
            if (_profileValueS.sex == 0) {
                cell.valueTextField.text = @"女";
            }else{
                cell.valueTextField.text = @"男";
            }
        }
            break;
        case 3:
        {
            cell.valueTextField.text = [NSString stringWithFormat:@"%ld",(long)_profileValueS.age];
        }
            break;
        case 4:
        {
            cell.valueTextField.text = _profileValueS.region;
        }
            break;
        case 5:
        {
            cell.valueTextField.text = _profileValueS.briefIntroduction;
        }
            break;
        default:
            break;
    }

    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 40;
}

#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


//这里应该需要监听UITextfield的代理方法
- (IBAction)onfinishedEditingClicked:(id)sender {
    
    NSString *phone = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_PHONE];
    NSArray<__kindof EditProfileCell *> *visibleCells = self.tableView.visibleCells;
    NSString *nickName = [visibleCells firstObject].valueTextField.text;
    NSString *password = visibleCells[1].valueTextField.text;
    NSString *sexStr = visibleCells[2].valueTextField.text;
    NSInteger age = [visibleCells[3].valueTextField.text integerValue];
    NSString *regionText = visibleCells[4].valueTextField.text;
    NSString *briefIntroductionText = visibleCells[5].valueTextField.text;
    BOOL sex = false;
    if ([sexStr isEqualToString:@"男"]) {
        sex = true;
    }else{
        sex = false;
    }
    
    [OBTAIN_SERVICE(EditProfileService) requestFinishedEditProfie:phone withPassword:password withAge:age withSex:true withRegion:regionText withBriefIntroduction:briefIntroductionText withNickname:nickName withComplete:^(EditProfileFinishedServiceData *serviceData, NSError *error) {
        
        if (error != nil) {
            NSLog(@"出现错误");
            return ;
        }
        [[VCToast make:@"编辑并保存成成功"] show];
        [self.navigationController popViewControllerAnimated:true];
    }];    
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



