//
//  GMAlertView.h
//  guimiquan
//
//  Created by Jesse Ou on 15/1/13.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^VCAlertViewConfirmBlock)(NSInteger buttonIndex);

@interface VCAlertView : UIViewController

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
             tapBlock:(VCAlertViewConfirmBlock)tapBlock;

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
             tapBlock:(VCAlertViewConfirmBlock)tapBlock
       onCustomWindow:(UIWindowLevel)level;

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
                image:(NSString *)image
             tapBlock:(VCAlertViewConfirmBlock)tapBlock;


@end

