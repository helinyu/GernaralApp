//
//  AutomationTextLabel.m
//  hairstyle
//
//  Created by felix on 16/3/14.
//  Copyright © 2016年 helen. All rights reserved.
//

#import "AutomationTextLabel.h"

#define LoadingTextStateCount 3
#define LoadingTextStateInitIndex 0
#define TimeDuration 0.5f
#define TextCount 7
//#define StateIdleLabelText @"刷新数据"
#define StatePullingLabelText @"松开刷新"

@interface AutomationTextLabel ()
{
    NSTimer *_timer;
    NSMutableArray *_textArray;
    NSInteger _textStateIndex;
}

@end

@implementation AutomationTextLabel

- (instancetype)initWithTexts:(NSMutableArray*)textArray{
   self =  [super init];
    [_textArray removeAllObjects];
    _textArray = textArray;
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tintColor = [UIColor grayColor];
        _textArray =(NSMutableArray*)@[@"正在刷新",@"正在刷新.",@"正在刷新..",@"正在刷新..."];
        
    }
    return self;
}

-(void)animating{
    if (_textStateIndex > LoadingTextStateCount) {
        _textStateIndex = LoadingTextStateInitIndex;
    }
    self.text = _textArray[_textStateIndex];
    _textStateIndex ++;
}

- (void)startAnimation{
    _textStateIndex = LoadingTextStateInitIndex;
    _timer = [NSTimer scheduledTimerWithTimeInterval:TimeDuration target:self selector:@selector(animating) userInfo:nil repeats:YES];
}

- (void)stopAnimationAtStateIdle{
//    self.text = StateIdleLabelText;
    [_timer invalidate];
    _timer = nil;
}

- (void)stopAnimationAtStatePulling{
    self.text = StatePullingLabelText;
}

- (void)stopAnimation{
    [_timer invalidate];
    _timer = nil;
}

@end
