//
//  AccountLogin.m
//  PsychologyApp
//
//  Created by felix on 16/1/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "AccountLogin.h"

@interface AccountLogin ()
@property (weak, nonatomic) IBOutlet UIWebView *accountWebView;

@end

@implementation AccountLogin

- (void)viewDidLoad{
    
    self.automaticallyAdjustsScrollViewInsets = NO;

  
}

- (IBAction)loadWeb:(id)sender {
    NSLog(@"登录");
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.104.132:8080"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSError *iAerror;
    
  NSData *received = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&iAerror];
//    NSLog(@"iAerror is : %@",iAerror);
    NSLog(@"code si : %ld",iAerror.code);
    
    if (received) {
          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict is : %@",dict);
    }else{
        
    }

}


@end
