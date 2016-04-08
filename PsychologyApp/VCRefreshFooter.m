//
//  MJDIYBackFooter.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/13.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "VCRefreshFooter.h"
#import "AutomationTextLabel.h"
#import "LoadOnAnimateView.h"

@interface VCRefreshFooter()

@property (weak, nonatomic) AutomationTextLabel *label;
@property (weak, nonatomic) LoadOnAnimateView *loadingView;

@end

@implementation VCRefreshFooter
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    AutomationTextLabel *label = [[AutomationTextLabel alloc] init];
    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:label];
    self.label = label;
    
    LoadOnAnimateView *loadview = [[LoadOnAnimateView alloc ] initWithFrame:CGRectMake(self.mj_w*0.5-30 - self.mj_h*0.75, self.bounds.origin.y+self.mj_h * 0.25, (self.mj_h * 0.5), (self.mj_h) *0.5) ];
    [self addSubview:loadview];
    self.loadingView = loadview;
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = self.bounds;
    
    self.label.frame = CGRectMake(self.mj_w*0.5-30,self.bounds.origin.y, self.mj_w*0.5 , self.mj_h);
    self.loadingView.frame = CGRectMake(self.mj_w*0.5 -30 - self.mj_h*0.75, self.bounds.origin.y+self.mj_h * 0.25, (self.mj_h * 0.5), (self.mj_h) *0.5) ;
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [self.loadingView stopAnimating];
            [self.label stopAnimationAtStateIdle];
            self.label.text = @"正在刷新...";
            break;
            
        case MJRefreshStatePulling:
            [self.loadingView stopAnimating];
            [self.label stopAnimationAtStatePulling];
            self.label.text = @"正在刷新...";
            break;
            
        case MJRefreshStateRefreshing:
            [self.loadingView startAnimating];
            [self.label startAnimation];

            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    self.label.textColor = [UIColor grayColor];

}

@end
