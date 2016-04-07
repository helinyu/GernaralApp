//
//  MainReading.h
//  PsychologyApp
//
//  Created by felix on 16/2/19.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleCategoryCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@end

@interface ReadingContentCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;
@end

@interface MainReading : UIViewController

@end


