//
//  UIView+Circle.m
//  WeLove
//
//  Created by liaowj on 14-4-4.
//  Copyright (c) 2014年 深圳市珍爱信息技术有限公司. All rights reserved.
//

#import "UIView+Circle.h"

@implementation UIView (Circle)

- (void)makeRectCircle {
    
    CGFloat radius = self.frame.size.width /2;
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    
}


- (void)setCornerWithRadius:(CGFloat)radius {
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
}

@end
