//
//  ViewController.m
//  PsychologyApp
//
//  Created by felix on 16/1/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "SplashScreen.h"

@interface SplashScreen ()

@end

@implementation SplashScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //test
   
    
    [self configureAdvisements];
}


- (void)configureAdvisements{
    NSLog(@"到我的界面去");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self toMineController:nil];
    });
    
}

- (IBAction)toMineController:(id)sender {
    
    [self performSegueWithIdentifier:@"SegueToMineController" sender:self];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
