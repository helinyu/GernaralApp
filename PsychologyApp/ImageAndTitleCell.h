//
//  ImageAndTitleCell.h
//  PsychologyApp
//
//  Created by felix on 16/2/20.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageAndTitleCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textTitlte;

- (void)setImageTitle:(NSString *)imageTitleText andTextTitle:(NSString *) textTitle;

@end
