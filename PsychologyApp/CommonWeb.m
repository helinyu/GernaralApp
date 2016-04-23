//
//  CommonWeb.m
//  PsychologyApp
//
//  Created by felix on 16/4/9.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "CommonWeb.h"
#import "TFHpple.h"
#import "TFHppleElement.h"
#import "XPathQuery.h"

#define pageHost @"http://yiapi.xinli001.com/v2/yi/article-content-page/"

@interface CommonWeb ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation CommonWeb


- (void)viewDidLoad{

    [super viewDidLoad];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",pageHost,_pageId];
    NSData *data = [[NSData alloc] initWithContentsOfFile:urlStr];
//    TFHpple * doc = [TFHpple hppleWithHTMLData:data];
    TFHpple* doc = [[TFHpple alloc] initWithHTMLData:data];
    NSArray * elements  = [doc peekAtSearchWithXPathQuery:@"//a[@class='\"title\']"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",pageHost,_pageId]]];
    [self.webView loadRequest:request];
}


@end
