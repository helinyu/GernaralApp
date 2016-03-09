//
//  MineBookingManagement.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineBookingManagement.h"


#define WIDTHOFBUTTON [UIScreen mainScreen].bounds.size.width /3

@interface MineBookingManagement ()


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withOfButtonTapbottomLabelLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingOfButtonTapbottomLabelLayoutConstraint;

@end

@implementation MineBookingManagement

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.withOfButtonTapbottomLabelLayoutConstraint.constant = WIDTHOFBUTTON ;
    
}

- (IBAction)onChangeTextClicked:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSInteger tag = button.tag -10 ;
    
    switch (tag) {
        case 1:
            self.leadingOfButtonTapbottomLabelLayoutConstraint.constant = 1 * WIDTHOFBUTTON ;
            break;
        case 2:
            self.leadingOfButtonTapbottomLabelLayoutConstraint.constant = 2 * WIDTHOFBUTTON ;
            break;
        default:
            self.leadingOfButtonTapbottomLabelLayoutConstraint.constant = 0.0 ;
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
