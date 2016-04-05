//
//  CommonFeedback.m
//  PsychologyApp
//
//  Created by felix on 16/2/18.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "MineFeedback.h"

#define GWidth [[UIScreen mainScreen] bounds].size.width
#define HEIGHT_TEN 10


@interface MineFeedback ()<UIImagePickerControllerDelegate,UINavigationBarDelegate>

@property (strong,nonatomic) UIButton * addImageButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewTopConstraint;

@end

@implementation MineFeedback

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTheInitButton];
    [self configureTextView];
    
}

- (void)configureTheInitButton{
    self.addImageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, GWidth/3, GWidth/3)];
    self.addImageButton.backgroundColor  = [UIColor blueColor];
    [self.view addSubview:self.addImageButton];
    [self.addImageButton setTitle:@"+" forState:UIControlStateNormal];
    [self.addImageButton setTintColor:[UIColor blackColor]];
    self.addImageButton.titleLabel.font = [UIFont systemFontOfSize:80];
    [self.addImageButton addTarget:self action:@selector(addImageAndConfigureButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureTextView{
    self.textViewTopConstraint.constant = GWidth/3+HEIGHT_TEN;
    [self.view setNeedsLayout];
}

- (void)addImageAndConfigureButton:(UIButton*)button{
    
//    增加图片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.editing = true;
    [self presentViewController:picker animated:true completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    CGFloat addImageButtonX = self.addImageButton.frame.origin.x;

    //    add ImageView
    UIImageView *imageView;
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(addImageButtonX, 0, GWidth/3, GWidth/3)];
        imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.userInteractionEnabled = true;
    [imageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(viewLargerPicktures:)]];
    [self.view addSubview:imageView];

//    configure button
    if ( addImageButtonX != GWidth * 2 / 3 ){
        self.addImageButton.frame = CGRectMake(addImageButtonX+GWidth/3, 0, GWidth/3, GWidth/3);
    }else{
        self.addImageButton.hidden = true ;
    }
    
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)onBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onFinishedClicked:(id)sender {
//    发送后台
    
//    返回
    [self.navigationController popViewControllerAnimated:true];

}

- (void)viewLargerPicktures:(UILongPressGestureRecognizer* ) gestureRecognizer{
    NSLog(@"手势");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
