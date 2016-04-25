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
#import "UIImageView+WebRequest.h"


NSInteger titleIndex = 2;
NSInteger sourceIndex = 5;
NSInteger timeIndex = 7;
NSInteger viewIndex = 9;

#define titleIndex 2
#define sourceIndex 5
#define timeIndex 7
#define viewIndex 9

#define pageHost @"http://yiapi.xinli001.com/v2/yi/article-content-page/"
#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define Article_to_Edge_Constraint 10
#define Article_Width [[UIScreen mainScreen] bounds].size.width - Article_to_Edge_Constraint * 2
#define View_height_Constraint 5

//label height of font large
#define Height_Of_LabelALine_Of_10 11.93359375
#define Height_Of_LabelALine_Of_12 14.3203125
#define Height_Of_LabelALine_Of_14 16.70703125
#define Height_Of_LabelALine_Of_16 19.09375
#define Height_Of_LabelALine_Of_18 21.48046875

@interface CommonWeb ()

@property (nonatomic,strong) NSString *articleTitle;
@property (nonatomic,strong) NSString *articleLocation;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CommonWeb

- (CGFloat)getHeightFrom:(NSString*)text withFontSize:(NSInteger)fontSize {
    
    CGFloat viewHeight = [text boundingRectWithSize:CGSizeMake(Article_Width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size.height;
    return viewHeight;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    CGFloat ControlBeginConstraint = 10.0;
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",pageHost,_pageId];
    
//    html中的数据生成解析数
    NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr] encoding:NSUTF8StringEncoding error:nil];  //htmlString是html网页的地址
    NSData *htmlData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    
//    解析class =title 的情况
    NSString *nodeElement = @"//div";
    NSArray * elements  = [xpathParser searchWithXPathQuery:nodeElement];
    for (TFHppleElement* element in elements) {
        if ([[element objectForKey:@"class"] isEqualToString:@"title"]) {
            
//       标题的处理
        NSArray *elementNodes = [element.raw componentsSeparatedByString:@">"];
        NSString* title = [elementNodes[titleIndex] componentsSeparatedByString:@"<"][0];
            CGFloat titleLabelHeight = [self getHeightFrom:title withFontSize:18];
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,titleLabelHeight )];
            titleLabel.font = [UIFont systemFontOfSize:18];
//        titleLabel.backgroundColor = [UIColor blueColor];
        [self.scrollView addSubview:titleLabel];
        titleLabel.text = title;
        NSInteger titleLabelMaxLinesNum = 2;
        titleLabel.numberOfLines = titleLabelMaxLinesNum;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        ControlBeginConstraint = View_height_Constraint+ControlBeginConstraint+titleLabelHeight;
//       来源
        NSString* source = [elementNodes[sourceIndex] componentsSeparatedByString:@"<"][0];
        source = [source stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            source = [source stringByReplacingOccurrencesOfString:@" " withString:@""];
        CGFloat sourceHeiht = [self getHeightFrom:source withFontSize:12];
        UILabel *sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,sourceHeiht )];
            [self.scrollView addSubview:sourceLabel];
//            sourceLabel.backgroundColor = [UIColor redColor];
            sourceLabel.text = [NSString stringWithFormat:@"来源于：%@",source];
            sourceLabel.textAlignment = NSTextAlignmentRight;
            sourceLabel.font = [UIFont systemFontOfSize:12];
            ControlBeginConstraint += sourceHeiht;
            
            //发表的时间
            NSString* releaseTime = [elementNodes[timeIndex] componentsSeparatedByString:@"<"][0];
            CGFloat releaseTimeHeiht = [self getHeightFrom:source withFontSize:10];
            UILabel *releaseTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,releaseTimeHeiht )];
            [self.scrollView addSubview:releaseTimeLabel];
//            releaseTimeLabel.backgroundColor = [UIColor redColor];
            releaseTimeLabel.text = releaseTime;
            releaseTimeLabel.textAlignment = NSTextAlignmentLeft;
            releaseTimeLabel.font = [UIFont systemFontOfSize:10];
            ControlBeginConstraint += releaseTimeHeiht;

            
//      发表的时间
        NSString* viewNum = [elementNodes[viewIndex] componentsSeparatedByString:@"<"][0];
            CGFloat viewNumHeiht = [self getHeightFrom:source withFontSize:10];
            UILabel *viewNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,viewNumHeiht )];
            [self.scrollView addSubview:viewNumLabel];
//            viewNumLabel.backgroundColor = [UIColor redColor];
            viewNumLabel.text = [NSString stringWithFormat:@"阅读量：%@",viewNum];
;
            viewNumLabel.textAlignment = NSTextAlignmentLeft;
            viewNumLabel.font = [UIFont systemFontOfSize:10];
            ControlBeginConstraint += viewNumHeiht;
        }

// 上面的标题已经处理了
        
// 下面处理正文
        if ([[element objectForKey:@"class"] isEqualToString:@"content"]) {
            NSArray *contents = [element.raw componentsSeparatedByString:@"</p>"];
            NSLog(@"element is :%@",element);
            NSLog(@"element count is :%lu",(unsigned long)contents.count);
            NSLog(@"");
            
//          处理相应的的图片（如果存放的是图片）
            for (NSInteger contentIndex = 0; contentIndex < contents.count; contentIndex++) {
                NSString *contentStr = contents[contentIndex];
                
                if ([contentStr containsString:@"style=\"text-align: center;\"><img"] ) {
//                        这个时候的内容图片放在中央的地方
                    NSArray *images = [contentStr componentsSeparatedByString:@"style=\"text-align: center;\"><img"];
                    NSArray *imageUrl = [images[1] componentsSeparatedByString:@"\" "];
                    NSArray *imageUrlStr = [imageUrl[0] componentsSeparatedByString:@"src=\""];
                    NSString *imagePngUrl = imageUrlStr[1];
                    UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint, ControlBeginConstraint+View_height_Constraint, Article_Width, Article_Width*3/5)];
                    [centerImageView setImageWithAbsoluteUrlStr:imagePngUrl];
                    [self.scrollView addSubview:centerImageView];
                    ControlBeginConstraint = ControlBeginConstraint + centerImageView.bounds.size.height + View_height_Constraint;
                    self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
//                    NSLog(@"bounds is ;%f",centerImageView.bounds.size.height);
                    continue;
                    
//                    不含有剧中的图片
                }else if([contentStr containsString:@"<img src="] ){
                    NSArray *images = [contentStr componentsSeparatedByString:@"<img src="];
                    NSArray *imageUrl = [images[1] componentsSeparatedByString:@"\""];
                    NSString *imagePngUrl = imageUrl[1];
                    UIImageView *centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint, ControlBeginConstraint+View_height_Constraint, Article_Width, Article_Width*3/5)];
                    [centerImageView setImageWithAbsoluteUrlStr:imagePngUrl];
                    [self.scrollView addSubview:centerImageView];
                    ControlBeginConstraint = ControlBeginConstraint + centerImageView.bounds.size.height + View_height_Constraint;
                    self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
//                    NSLog(@"bounds is ;%f",centerImageView.bounds.size.height);
                    continue;
                }
                
                if ([contentStr containsString:@"<p style=\"text-align: center;\"><strong>"]) {
                    NSArray* centerStrS = [contentStr componentsSeparatedByString:@"<p style=\"text-align: center;\"><strong>"];
                    NSString* centerStr = centerStrS[1];
                    centerStr = [centerStr componentsSeparatedByString:@"</strong>"][0];
                    CGFloat centerStrHeight = [self getHeightFrom:centerStr withFontSize:14];
                    UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,centerStrHeight)];
                    textLabel.text = centerStr;
                    textLabel.numberOfLines = 0;
                    textLabel.textAlignment = NSTextAlignmentCenter;
                    textLabel.font = [UIFont systemFontOfSize:14];
                    [self.scrollView addSubview:textLabel];
                    ControlBeginConstraint += centerStrHeight;
                    self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
                    continue;
                }else if([contentStr containsString:@"<p style=\"text-align: center;\">"]) {
                    NSArray* centerStrS = [contentStr componentsSeparatedByString:@"<p style=\"text-align: center;\">"];
                    NSString* centerStr = centerStrS[1];
                    
                    CGFloat centerStrHeight = [self getHeightFrom:centerStr withFontSize:14];
                     UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,centerStrHeight)];
                    textLabel.text = centerStr;
                    textLabel.numberOfLines = 0;
                    textLabel.font = [UIFont systemFontOfSize:14];
                    [self.scrollView addSubview:textLabel];
                    ControlBeginConstraint += centerStrHeight;
                    self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
                    continue;
                    NSLog(@"");
                }else if([contentStr containsString:@"<p><strong>"]){
                    NSArray* centerStrS = [contentStr componentsSeparatedByString:@"<p><strong>"];
                    NSString* centerStr = centerStrS[1];
                    centerStr = [centerStr componentsSeparatedByString:@"</strong>"][0];
                    
                    CGFloat centerStrHeight = [self getHeightFrom:centerStr withFontSize:14];
                        UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,centerStrHeight)];
                        textLabel.text = centerStr;
                        textLabel.numberOfLines = 0;
                        textLabel.font = [UIFont systemFontOfSize:14];
                        [self.scrollView addSubview:textLabel];
                        ControlBeginConstraint += centerStrHeight;
                        self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
                        continue;
                    }else if([contentStr containsString:@"<p>"]){
//                        去掉p中含有strong的类型
                        
                     NSArray* centerStrS = [contentStr componentsSeparatedByString:@"<p>"];
                    NSString* centerStr = centerStrS[1];
                        BOOL aliCenter = false;
                        
                        if ([centerStr containsString:@"<strong>"]) {
                            NSArray *centerStrChilds = [centerStr componentsSeparatedByString:@"<strong>"];
                            NSMutableString *tmpStr = [NSMutableString new];
                            
                            for (NSInteger index=0; index < centerStrChilds.count; index++) {
                                if ([centerStrChilds[index] containsString:@"</strong>"]) {
                                    NSArray* centerStrChildsChilds = [centerStrChilds[index] componentsSeparatedByString:@"</strong>"];
                                    [tmpStr appendString:centerStrChildsChilds[0]];
                                }else{
                                    [tmpStr appendString:centerStrChilds[index]];
                                }
                            }
                            centerStr = tmpStr;
                        }else if([centerStr containsString:@"</strong>"]){
                            if ([centerStr containsString:@"center"]) {
                                aliCenter = true;
                            }
                            NSArray *contents = [centerStr componentsSeparatedByString:@"</strong>"];
                           NSArray* centerStrS = [contents[0] componentsSeparatedByString:@">"];
                            centerStr = centerStrS[centerStrS.count-1];
                        }
                        CGFloat centerStrHeight = [self getHeightFrom:centerStr withFontSize:14];
                        UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,centerStrHeight)];
                        textLabel.text = centerStr;
                        textLabel.numberOfLines = 0;
                        textLabel.font = [UIFont systemFontOfSize:14];
                        [self.scrollView addSubview:textLabel];
                        if (aliCenter == true) {
                            textLabel.textAlignment = NSTextAlignmentCenter;
                        }
                        ControlBeginConstraint += centerStrHeight;
                        self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
                        continue;
                        
                    NSLog(@"");

                }else if([contentStr containsString:@"</strong>"]){
                    NSArray* centerStrS = [contentStr componentsSeparatedByString:@"</strong>"];
                    NSString* centerStr = centerStrS[1];
                    centerStr = [centerStr componentsSeparatedByString:@"</strong>"][0];
                    CGFloat centerStrHeight = [self getHeightFrom:centerStr withFontSize:14];
                    UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,centerStrHeight)];
                    textLabel.text = centerStr;
                    textLabel.numberOfLines = 0;
                    textLabel.font = [UIFont systemFontOfSize:14];
                    [self.scrollView addSubview:textLabel];
                    ControlBeginConstraint += centerStrHeight;
                    self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
                    continue;
                }else if ([contentStr containsString:@"</strong>"]){
                    NSCharacterSet *charachterSet = [NSCharacterSet characterSetWithCharactersInString:@"<>"];
                    NSArray *contents = [contentStr componentsSeparatedByCharactersInSet:charachterSet];
                    NSString *centerStr = contents[1];
                    CGFloat centerStrHeight = [self getHeightFrom:centerStr withFontSize:14];
                    UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(Article_to_Edge_Constraint,ControlBeginConstraint+View_height_Constraint, Article_Width ,centerStrHeight)];
                    textLabel.text = centerStr;
                    textLabel.numberOfLines = 0;
                    textLabel.font = [UIFont systemFontOfSize:14];
                    [self.scrollView addSubview:textLabel];
                    ControlBeginConstraint += centerStrHeight;
                    self.scrollView.contentSize = CGSizeMake(Screen_Width, ControlBeginConstraint);
                    continue;
                }
            }
        }
    }

//     NSLog(@"h2 element is :%@",[element firstChildWithTagName:@"h2"].raw);
//解析含有p的标签
//    NSString *nodeString = @"//p";
//    NSArray *elements1  = [xpathParser searchWithXPathQuery:nodeString];
    //这个数组中就有需要的值
//    NSLog(@"elements are :%@",elements);
    
//    标题
//    NSString *nodeTitle = @"//title";
//    NSArray *titles = [xpathParser searchWithXPathQuery:nodeTitle];
//    NSLog(@"titles are %@",titles);
}

//- (void)parserByElements:(TFHppleElement*)element withResult:(NSMutableArray*)results{
//
//    if (element.hasChildren) {
//        NSArray* elementchilds = element.children;
//        element.isTextNode
//        for (NSInteger index=0; index<elementchilds.count; index++) {
//            TFHppleElement *elementChild =  elementchilds[index];
//            if (!elementChild.hasChildren) {
//                NSString *rawText = elementChild.raw;
//                if (rawText != nil) {
//                    [results addObject:rawText];
//                }
//                continue;
//            }
//            for (NSInteger index = 0; index < elementChild.children.count ; index++) {
//                [self parserByElements:elementchilds[index] withResult:results];
//            }
//        }
//    }else{
//        if (element.raw != nil) {
//            [results addObject:element.raw];
//        }
//    }
//}

@end
