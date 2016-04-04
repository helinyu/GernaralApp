//
//  GMAlertView.m
//  guimiquan
//
//  Created by Jesse Ou on 15/1/13.
//  Copyright (c) 2015年 Vanchu. All rights reserved.
//

#import "VCAlertView.h"
#import "Helper+Time.h"
#import "ServiceManager.h"
#import "UIColor+Helper.h"
#import "UIView+FrameMethods.h"

const NSInteger SCROLLVIEW_MAX_HEIGHT = 300;
const NSInteger VCDefaultLevelGreaterAlertwindow = 100;

@interface VCAlertView (){
    VCAlertViewConfirmBlock _confirmBlock;
    NSString *_dataTitle;
    NSString *_dataMessage;
    NSString *_dataCancelTitle;
    NSString *_dataOtherTitle;
    NSString *_dataImage;
    
    UIWindow *_alertWindow;
}

@property (weak, nonatomic) IBOutlet UIView *ctrlWrapView;

@property (weak, nonatomic) IBOutlet UILabel *ctrlTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ctrlTitleTop;

@property (weak, nonatomic) IBOutlet UIScrollView *ctrlScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ctrlScrollViewLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ctrlScrollViewHeight;
@property (weak, nonatomic) IBOutlet UILabel *ctrlContent;

@property (weak, nonatomic) IBOutlet UIButton *ctrlCancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *ctrlConfirmBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelBtnFixwidthConstraint;

@end

@implementation VCAlertView

- (void)viewDidLoad {
	[super viewDidLoad];
	
   // self.shouldDisplayStatusBar = YES;
    
    self.ctrlWrapView.layer.cornerRadius = 5;
    self.ctrlTitle.text = _dataTitle;
    
    if (!_dataTitle || _dataTitle.length == 0) {
        self.ctrlTitleTop.constant = 10;
    }
    
    if (_dataCancelTitle && _dataCancelTitle.length > 0) {
        [self.ctrlCancelBtn setTitle:_dataCancelTitle forState:UIControlStateNormal];
        self.cancelBtnFixwidthConstraint.constant = self.ctrlWrapView.width / 2;
    }else {
        self.ctrlCancelBtn.hidden = YES;
        self.cancelBtnFixwidthConstraint.constant = 0;
    }
    
    if (_dataOtherTitle && _dataOtherTitle.length > 0) {
        [self.ctrlConfirmBtn setTitle:_dataOtherTitle forState:UIControlStateNormal];
        
        if (_dataCancelTitle) {
            self.cancelBtnFixwidthConstraint.constant = self.ctrlWrapView.width / 2;
        }
    }else {
        self.ctrlConfirmBtn.hidden = YES;
        
        if (_dataCancelTitle)
            self.cancelBtnFixwidthConstraint.constant = self.ctrlWrapView.width;
    }
    

}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.ctrlContent.text = _dataMessage;
    [self.ctrlContent sizeToFit];

    self.ctrlScrollViewHeight.constant =self.ctrlContent.frame.size.height+5;
    [self.view layoutIfNeeded];

}

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
                image:(NSString *)image
             tapBlock:(VCAlertViewConfirmBlock)tapBlock
       onCustomWindow:(UIWindowLevel)level {

    _confirmBlock = tapBlock;
    _dataTitle = title;
    _dataMessage = message;
    _dataCancelTitle = cancelTitle;
    _dataOtherTitle = otherTitle;
    _dataImage = image;
    
    _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _alertWindow.windowLevel = level;
    _alertWindow.rootViewController = self;

    _alertWindow.hidden = NO;
}

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
             tapBlock:(VCAlertViewConfirmBlock)tapBlock {
    
    [self showWithTitle:title message:message cancelButtonTitle:cancelTitle otherButtonTitle:otherTitle image:@"" tapBlock:tapBlock onCustomWindow:UIWindowLevelAlert + VCDefaultLevelGreaterAlertwindow];
    
}

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
                image:(NSString *)image
             tapBlock:(VCAlertViewConfirmBlock)tapBlock {
    
    [self showWithTitle:title message:message cancelButtonTitle:cancelTitle otherButtonTitle:otherTitle image:image tapBlock:tapBlock onCustomWindow:UIWindowLevelAlert + VCDefaultLevelGreaterAlertwindow];
    
}

- (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelTitle
     otherButtonTitle:(NSString *)otherTitle
             tapBlock:(VCAlertViewConfirmBlock)tapBlock
       onCustomWindow:(UIWindowLevel)level {
    
    [self showWithTitle:title message:message cancelButtonTitle:cancelTitle otherButtonTitle:otherTitle image:@"" tapBlock:tapBlock onCustomWindow:level];
}

- (IBAction)onCancelBtnClicked:(id)sender {
    if(_confirmBlock)
        _confirmBlock(0);
    _alertWindow.hidden = YES;
    _alertWindow = nil;
}

- (IBAction)onConfirmBtnClicked:(id)sender {
    if(_confirmBlock)
        _confirmBlock(1);
    if (_dataCancelTitle) {
        _alertWindow.hidden = YES;
        _alertWindow = nil;
    }
}

@end

