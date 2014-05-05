//
//  UIView+Circle.h
//  WeLove
//
//  Created by liaowj on 14-4-4.
//  Copyright (c) 2014年 深圳市珍爱信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Circle)

/*
 * 你是否还在为UIView的frame没有一键变圆而烦恼!
 * 你是否觉得应该有这么一种便捷的方法存在!
 * 那你来对了!
 * 帮你一秒把UIView的frame变成圆的!
 * 简单实用安全无副作用
 * 妈妈再也不用担心我写代码速度慢了
 * 忘了说了,传入的UIVIEW必须是方的!
 */
- (void)makeRectCircle;

/*
 * 业界良心!不一定是要变圆!
 * 省去每次都设置setMasksToBounds:YES的麻烦
 */
-(void)setCornerWithRadius:(CGFloat)radius;


@end
