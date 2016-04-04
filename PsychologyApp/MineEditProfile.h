//
//  MineEditProfile.h
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineEditProfile : UITableViewController
/**
 *  传递需要的参数过来
 *
 *  @param name       用户的名字（string）
 *  @param image      用户的头像(UIImage)
 *  @param attributes 传递用户的属性(有顺序的：nickname,age,sex,region,briefIntroduction)
 */
- (void)setHeaderName:(NSString *)name withHeaderImage:(UIImage*)image ;

@end

