//
//  CommentToBottomView.m
//  test
//
//  Created by felix on 16/4/13.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "CommentToBottomView.h"

@interface CommentToBottomView()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@end

@implementation CommentToBottomView

- (void)awakeFromNib{
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self loadView];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder: aDecoder];
    [self loadView];
    return  self;
}

- (void)loadView{
    [[NSBundle mainBundle] loadNibNamed:@"CommentToBottomView" owner:self options:nil];
    self.contentView.frame = self.bounds ;
    [self addSubview:self.contentView];
}

- (IBAction)onSendClicked:(id)sender {
    NSLog(@"text:%@",self.contentTextView.text);
    [self.commentDelegate deliverTextViewText:self.contentTextView.text];
}



@end
