//
//  UIViewController+Navigation.m
//  PsychologyApp
//
//  Created by felix on 16/4/26.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)


- (void)awakeFromNib{
    [super awakeFromNib];
    UIBarButtonItem *backBarItem = [UIBarButtonItem new];
    backBarItem.title = @"";
    self.navigationItem.backBarButtonItem = backBarItem;
    
//             let backBarItem = UIBarButtonItem.init()
//            backBarItem.title = "返回"
//            self.navigationItem.backBarButtonItem = backBarItem
}

@end
