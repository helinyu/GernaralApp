//
//  SplashScreen.m
//  PsychologyApp
//
//  Created by felix on 16/2/17.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "SplashScreen.h"
#import "MainIndex.h"

@interface SplashScreen ()

@end

@implementation SplashScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航栏存在的时候
    if (self.navigationItem) {
        //这个就可以实现了 "<返回" 这个效果
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backBarButton;
    }
    
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MainIndex class])] animated:YES];
}
- (IBAction)onMainIndexClicked:(id)sender {
    
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MainIndex class])] animated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
