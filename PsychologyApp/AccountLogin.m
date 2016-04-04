//
//  AccountLogin.m
//  PsychologyApp
//
//  Created by felix on 16/1/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "AccountLogin.h"
#import "UserService.h"
#import "ServiceManager.h"
#import "VCToast.h"

@interface AccountLogin ()
{
    NSString *phone;
    NSString *password;
}

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation AccountLogin

- (void)viewDidLoad{
    
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (IBAction)onBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)onLoginWithMobileClicked:(id)sender {
    NSLog(@"这里进行实现登录");
    phone = self.phoneTextField.text;
    password = self.passwordTextField.text;
    
    [OBTAIN_SERVICE(UserService) requestLoginWithMobile:phone withPassword:password withComplete:^(NSInteger ret) {
        NSLog(@"ret is : %ld",ret);
        
        if (ret == 0) {
            [[VCToast make:@"登录成功"] show];
            [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_PHONE object:nil userInfo:@{LOGIN_PHONE:self.phoneTextField.text}];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [[VCToast make:@"登录失败"] show];
        }
    }];
    
}

@end
