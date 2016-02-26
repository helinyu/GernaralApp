//
//  Helper+Style.m
//  guimiquan
//
//  Created by Daly on 15/3/19.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import "Helper+Style.h"
#import "UIColor+Helper.h"
#import "AppDefinition.h"
//#import "GMMenu.h"
#import "Helper+System.h"

@implementation Helper (Style)


+ (void)setupStyle{
    
    //step 1. remove gradiant background effect for NavBar in iOS6
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //设置navigaionBar 的全局颜色
//    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
//    UINavigationBar.appearance().barTintColor = UIColor.init(red: 23.0/255, green: 158.0/255, blue: 120.0/255, alpha: 1.0)
//    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
//    UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
//    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()] ;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
//    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithHex:BBS_FONT_COLOR_RED]];
    if([UINavigationBar instancesRespondToSelector:@selector(setBarTintColor:)]){
//        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHex:BBS_FONT_COLOR_RED]];
    }
		
    //step 2. remove gradiant background effect for TabBar in iOS6
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundColor:[UIColor colorWithHex:0xF7F7F7]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage new]];
    
    //step 3. set text color for TabBarItem
    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor colorWithHex:0x9b9b9b],
                                                        UITextAttributeFont:[UIFont boldSystemFontOfSize:11]}
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor colorWithHex:0xff7a6e],
                                                        UITextAttributeFont:[UIFont boldSystemFontOfSize:11]}
                                             forState:UIControlStateSelected];
    
    
    
    
    
    UIBarButtonItem* appearanceDefault = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    UIBarButtonItem* appearancePicker = [UIBarButtonItem appearanceWhenContainedIn:UIImagePickerController.class, nil];
    
    NSArray *appearanceArr = @[appearanceDefault, appearancePicker];
    
    //设置返回按钮的图片样式
    //step 4. set style for NavBar backButton
    UIImage *backButtonBackgroundImage = [UIImage imageNamed:@"icon_common_nav_backArrow"];
    // The background should be pinned to the left and not stretch.
    
    for (UIBarButtonItem *appearance in appearanceArr) {
        if([Helper isGreaterOrEqualToIOS7])
        {
            backButtonBackgroundImage = [backButtonBackgroundImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [[UINavigationBar appearance] setBackIndicatorImage:backButtonBackgroundImage];
            [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backButtonBackgroundImage];
            
        }
        else{
            backButtonBackgroundImage = [backButtonBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBackgroundImage.size.width - 1, 0, 0)];
            [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [appearance setBackButtonTitlePositionAdjustment:UIOffsetMake(3, 0) forBarMetrics:UIBarMetricsDefault];
        }
        
        [appearance setTintColor:[UIColor whiteColor]];
        
        [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                             UITextAttributeFont:[UIFont boldSystemFontOfSize:16],
                                             UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero]
                                             } forState:UIControlStateNormal];
        
        
        [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                             UITextAttributeFont:[UIFont boldSystemFontOfSize:16],
                                             UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero]
                                             } forState:UIControlStateHighlighted];
    }
    
    
    
    

    
//    [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    /*
    [[UIBarButtonItem appearanceWhenContainedIn:UIImagePickerController.class, nil] setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearanceWhenContainedIn:UIImagePickerController.class, nil] setBackButtonTitlePositionAdjustment:UIOffsetMake(3, 0) forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearanceWhenContainedIn:UIImagePickerController.class, nil] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                         UITextAttributeFont:[UIFont boldSystemFontOfSize:16],
                                         UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero]
                                         } forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearanceWhenContainedIn:UIImagePickerController.class, nil] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                         UITextAttributeFont:[UIFont boldSystemFontOfSize:16],
                                         UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero]
                                         } forState:UIControlStateHighlighted];
    */
    
    
    [[UIBarButtonItem appearance] setBackgroundImage:[[UIImage alloc] init] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    if ([UIBarButtonItem instancesRespondToSelector:@selector(setTintColor:)]) {
        [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    }
    
    
    
    //step 5. set navigation item title
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont systemFontOfSize:20],NSFontAttributeName,
      [UIColor whiteColor],UITextAttributeTextColor,
      nil]];
    
    
    
    //tableview分隔线左边不留空隙
    if ([UITableView instancesRespondToSelector:@selector(setSeparatorInset:)]) {
        [[UITableView appearance] setSeparatorInset:UIEdgeInsetsZero];
    }
    /*
     UITableView* tableControllerTableViewAppearance = [UITableView appearanceWhenContainedIn:[UITableViewController class], nil];
     if ([UITableView instancesRespondToSelector:@selector(setLayoutMargins:)]) {
     [[UITableView appearance] setLayoutMargins:UIEdgeInsetsZero];
     [tableControllerTableViewAppearance setLayoutMargins:UIEdgeInsetsZero];
     
     NSLog(@"%@", NSStringFromUIEdgeInsets(tableControllerTableViewAppearance.layoutMargins));
     }
     */
    
    
    if ([UITableViewCell instancesRespondToSelector:@selector(setSeparatorInset:)]) {
        [[UITableViewCell appearance] setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([UITableViewCell instancesRespondToSelector:@selector(setLayoutMargins:)]) {
        [[UITableViewCell appearance] setLayoutMargins:UIEdgeInsetsZero];
    }
    
    //    [[UIView appearance] setLayoutMargins:UIEdgeInsetsZero];
    //step 6. set cancel button in searchbar
//    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor colorWithHex:COLOR_HEX_VALUE_CANCEL_BUTTON_IN_SEARCHBAR]} forState:UIControlStateNormal];

    //step 7. set GMMenu Style
    
//    [GMMenu setTintColor: [UIColor colorWithRed:76/255.0f green:76/255.0f blue:76/255.0f alpha:1.0]];
//    [GMMenu setTitleFont:[UIFont boldSystemFontOfSize:12]];


}

@end
