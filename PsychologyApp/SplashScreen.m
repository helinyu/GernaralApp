//
//  SplashScreen.m
//  PsychologyApp
//
//  Created by felix on 16/2/17.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "SplashScreen.h"
#import "MainIndex.h"
#import "ServiceManager.h"
#import "AppDefinition.h"
#import "UIImageView+WebRequest.h"
#import "AppService.h"

@interface SplashScreen ()
{
    NSString* _btnLinkStr;
    BOOL _isClicked;
}
@property (weak, nonatomic) IBOutlet UIButton *configureAdClicksButton;
@property (weak, nonatomic) IBOutlet UIImageView *configureAdClicksImageView;
@property (weak, nonatomic) IBOutlet UIView *configureAdClicksView;

@end

@implementation SplashScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hidenAdvisements:NO];

//    NSLog(@"screenis ; %f,%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    
    //导航栏存在的时候
    if (self.navigationItem) {
        //这个就可以实现了 "<返回" 这个效果
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backBarButton;
    }
    
    //test advitisements
//    self.configureAdClicksImageView.image = [UIImage imageNamed:@"/Users/felix/mysql_PsychologyApp/PICTURE0.png"];
//    _btnLinkStr = @"http://baidu.com";
    //跳转
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self performSegueWithIdentifier:@"SegueToMainControler" sender:self];
//    });
    
    [self loadAdvisements];
}

//配置当前的屏幕的大小
- (NSString *)currentScreeenSize{
    NSString *size = PICTURE2;
    CGSize appSize = [[UIScreen mainScreen] bounds].size;
    CGFloat appWidth = appSize.width;
    CGFloat appHigh = appSize.height;
  
    //320*480 320*480 375*667 414*736
    if (appWidth == 320) {
        if (appHigh == 480) {
            size = PICTURE0;
        }else{
            size = PICTURE1;
        }
    }else if(appWidth == 414){
        size = PICTURE2;
    }else{
        size = PICTURE3;
    }
    
    return size;
}

- (void)loadAdvisements{
//    NSString *size = [self currentScreeenSize];
    
//    [OBTAIN_SERVICE(AppService) requestSplashScreenWithSize:size withComplete:^(AppServiceSplashScreenData *appServiceSplashScreenData, NSError *error) {
//        //这类使用图片的设置
//        
//        if (error.code) {
//            //没有显示图片
//            [self hidenAdvisements:YES];
//            return ;
//        }
//        
//        if (appServiceSplashScreenData.image_name.length == 0) {
//            [self hidenAdvisements:YES];
//        }else{
//            [self hidenAdvisements:NO];
//            _btnLinkStr = appServiceSplashScreenData.image_link;
//            [self.configureAdClicksImageView setImageWithAbsoluteUrlStr:appServiceSplashScreenData.image_name];
////                /Users/felix/mysql_PsychologyApp/PICTURE0.png  //图片链接
////                [self.configureAdClicksImageView setImageWithAbsoluteUrlStr:@"/Users/felix/mysql_PsychologyApp/PICTURE0.png"];
//            [self.configureAdClicksImageView setImageWithAbsoluteUrlStr:appServiceSplashScreenData.image_name];
////            }
//        }
//    }];
    
    //test 使用与测试的网络
    [self.configureAdClicksImageView setImageWithAbsoluteUrlStr:@"http://localhost/background/content/../images/splashscreen/PICTURE2.png"];
    [self configureAdClicksButtonNoMoreThanTen:@"到广告中去"];
    
    //跳转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"SegueToMainControler" sender:self];
    });
}


//配置按钮
- (void)configureAdClicksButtonNoMoreThanTen:(NSString *)buttonStr{
    
    if (buttonStr == nil) {
        [_configureAdClicksButton setHidden:YES];
        return;
    }
    
    if (buttonStr.length >10) {
        [_configureAdClicksButton setTitle:[buttonStr substringToIndex:10] forState:UIControlStateNormal];
    }else{
        [_configureAdClicksButton setTitle:buttonStr forState:UIControlStateNormal];
    }
}

//隐藏广告
- (void)hidenAdvisements:(BOOL)ishiden{
    self.configureAdClicksButton.hidden = ishiden;
    self.configureAdClicksImageView.hidden = ishiden;
    self.configureAdClicksView.hidden = ishiden;
}

- (IBAction)onMainIndexClicked:(id)sender {
    //有广告点击之后的情况
    NSLog(@"到广告的页面中区");
    _isClicked = YES ;
    
//    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MainIndex class])] animated:YES];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if ([segue.identifier isEqualToString:@"SegueToMainControler"]) {
        MainIndex *main  = segue.destinationViewController;
        if (_isClicked) {
            [main setADLink:_btnLinkStr with:_isClicked];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
