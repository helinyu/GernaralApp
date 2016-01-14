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

    
}

- (IBAction)toMineController:(id)sender {
    
    [self performSegueWithIdentifier:@"SegueToMineController" sender:self];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
