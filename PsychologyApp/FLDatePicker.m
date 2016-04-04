//
//  FLDatePicker.m
//  PsychologyApp
//
//  Created by felix on 16/4/4.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "FLDatePicker.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FLDatePicker ()
{
    void (^_confirmBlock)(NSDate* date ,NSInteger index);
    
    NSInteger _defaultRow;
    NSArray  *_datasource;
    NSString *_selectedData;
    NSInteger _selectedIndex;

}
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *defineBtn;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation FLDatePicker

+ (FLDatePicker *)makeWithTitle:(NSString *)title{
    
    FLDatePicker *picker = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FLDatePicker class]) owner:self options:nil] firstObject];
    
    picker.translatesAutoresizingMaskIntoConstraints = false ;
    picker.titleLabel.text = title;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:picker action:@selector(onCancelClicked:)];
    [picker addGestureRecognizer:tap];

    return picker;
}

-(void)showInView:(UIView *)parentView withConfirm:(void (^)(NSDate* date ,NSInteger index))confirmBlock{
    _confirmBlock = confirmBlock;

    [parentView addSubview:self];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
}

- (IBAction)onCancelClicked:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)onConfirmClicked:(id)sender {
    
    if (_confirmBlock) {
        NSTimeInterval time = self.datePicker.date.timeIntervalSince1970 + 8*60*60 ;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
        _confirmBlock(date,_selectedIndex);
    }
    [self removeFromSuperview];
}



@end
