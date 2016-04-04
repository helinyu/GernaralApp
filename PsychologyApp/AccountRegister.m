//
//  AccountRegister.m
//  PsychologyApp
//
//  Created by felix on 16/2/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "AccountRegister.h"
#import "VCToast.h"

@interface AccountRegister ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTexfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextfield;

@end

@implementation AccountRegister

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onBackToLoginClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)confirmRegister:(id)sender {
//    NSLog(@"确认注册");
//    NSLog(@"密码是：%@",self.passwordTextfield.text);
//    NSLog(@"确认是：%@",self.confirmTextfield.text);
//    NSLog(@"手机号码：%@",self.phoneTexfield.text);
    
    if (([self.passwordTextfield.text isEqualToString:@""]) || ([self.confirmTextfield.text isEqualToString:@""])) {
        NSLog(@"password is not will be nil");
        return;
    }
    
    if ([self.passwordTextfield.text isEqualToString:self.confirmTextfield.text]) {
        NSLog(@"两次输入的密码是相同的");
        
        [OBTAIN_SERVICE(UserService) requestRegisterWithMobile:self.phoneTexfield.text withPassword:self.passwordTextfield.text withComplete:^(NSInteger ret) {
            NSLog(@"ret is ： %ld",ret);
            if (ret == 0) {
                [[VCToast make:@"注册成功"] show];
                [[NSNotificationCenter defaultCenter] postNotificationName:REGISTER_PHONE object:nil userInfo:@{REGISTER_PHONE:self.phoneTexfield.text}];
                
                [self.navigationController popToRootViewControllerAnimated:true];
            } else{
                [[VCToast make:@"注册失败"] show];
            }
        }];
      }
}


@end
