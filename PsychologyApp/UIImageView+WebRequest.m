//
//  UIImageView+WebRequest.m
//  VTR
//
//  Created by GavinHe on 16/1/7.
//  Copyright © 2016年 vanchu. All rights reserved.
//

#import "UIImageView+WebRequest.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (WebRequest)
- (void)setImageWithAbsoluteUrlStr:(NSString *)urlStr{
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
}

@end
