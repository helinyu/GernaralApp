//
//  MJBannnerPlayer.h
//  MJBannerPlayer
//
//  Created by WuXushun on 16/1/21.
//  Copyright © 2016年 wuxushun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJBannnerPlayerDeledage <NSObject>

-(void)MJBannnerPlayer:(UIView *)bannerPlayer didSelectedIndex:(NSInteger)index;

@end

@interface MJBannnerPlayer : UIView

@property (nonatomic) CGFloat timeInterval;
@property (strong, nonatomic) NSArray *sourceArray;
@property (strong, nonatomic) NSArray *urlArray;
@property (strong, nonatomic) id<MJBannnerPlayerDeledage> delegate;

//初始化一个本地图片播放器
+ (void)initWithSourceArray:(NSArray *)picArray
                  addTarget:(id)controller
                   delegate:(id)delegate
                   withSize:(CGRect)frame
           withTimeInterval:(CGFloat)interval;


//初始化一个网络图片播放器
+ (void)initWithUrlArray:(NSArray *)urlArray
               addTarget:(UIViewController *)controller
                delegate:(id)delegate
                withSize:(CGRect)frame
        withTimeInterval:(CGFloat)interval;

//设置图片
-(void)setImage:(NSArray *)sourceList;

@end
