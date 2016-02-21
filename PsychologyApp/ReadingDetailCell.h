//
//  ReadingDetailCell.h
//  PsychologyApp
//
//  Created by felix on 16/2/21.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadingDetailCell : UITableViewCell

- (void)setLeftImageView:(NSString *)leftImageText
          withTitleLabel:(NSString*)titleText
         withDetailLabel:(NSString*)detailText
         withNumberLabel:(NSInteger)number;

@end
