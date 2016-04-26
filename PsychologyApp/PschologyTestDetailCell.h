//
//  PschologyTestDetailCellTableViewCell.h
//  PsychologyApp
//
//  Created by felix on 16/4/23.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLIndexPath.h"


@protocol PschologyTestDetailCellDelegate <NSObject>
@optional
- (void)hasClickedCellBtnIndex:(FLIndexPath*)indexpath;
@end

@interface PschologyTestDetailCell : UITableViewCell
@property (nonatomic,weak) id<PschologyTestDetailCellDelegate> detailCellDelegate;
- (void)configureCellOfDescription:(NSString*)description withNSIndexPath:(FLIndexPath*)indexpath;
@end
