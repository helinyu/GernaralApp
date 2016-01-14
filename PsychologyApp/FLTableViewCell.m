//
//  FLTableViewCell.m
//  PsychologyApp
//
//  Created by felix on 16/1/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "FLTableViewCell.h"

@interface FLTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *generalizationLabel;

@end

@implementation FLTableViewCell


- (void)cellWithImage:(UIImage*)image andGeneralizatonWithtext:(NSString*)text{
    self.headerImageView.image = image;
    self.generalizationLabel.text = text;
}

@end
