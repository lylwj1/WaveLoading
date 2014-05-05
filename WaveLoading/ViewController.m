//
//  ViewController.m
//  WaveLoading
//
//  Created by liaowj on 14-5-5.
//  Copyright (c) 2014年 liaowj. All rights reserved.

//  简单的效果就不谈什么版权所有了
//  想要看更多特效,欢迎下载WeLove应用
//  才不会说有很多妹纸呢

#import "ViewController.h"
#import "UIView+Circle.h"
#import "CPAnimationProgram.h"
#import "CPAnimationSequence.h"

static const CGFloat kTimeForDelay = 5.0;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *circleS;
@property (weak, nonatomic) IBOutlet UIView *circleM;
@property (weak, nonatomic) IBOutlet UIView *circleL;

@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *redHeart;

@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation ViewController
{
    NSTimer *timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
    [self openTimer];
    [self closeLoadingAfterEventCompleted];
}

#pragma mark - Init

- (void)initUI {
    [_circleL makeRectCircle];
    [_circleM makeRectCircle];
    [_circleS makeRectCircle];
    
    _loadingView.hidden = NO;
    _mainView.hidden = YES;
    [self setAlpha:0];
}

- (void)setAlpha:(CGFloat)alpha {
    _circleS.alpha = alpha;
    _circleM.alpha = alpha;
    _circleL.alpha = alpha;
}

/**
 * close the loading animation after some asynchronous operation is complete;
 * e.g: network request
 */
- (void)closeLoadingAfterEventCompleted{
    [self performSelector:@selector(closeLoadingAnimation) withObject:self afterDelay:kTimeForDelay];

}

- (IBAction)showAgainBtnListener:(id)sender {
    
    [self initUI];
    [self openTimer];
    [self closeLoadingAfterEventCompleted];
}


#pragma mark - Timer

- (void)openTimer {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.9
                                             target:self
                                           selector:@selector(loadingAnimation)
                                           userInfo:nil
                                            repeats:YES];
    [timer fire];

}

- (void)closeTime {
    [timer invalidate];
}

#pragma mark - Animation Function Sets

- (void)loadingAnimation
{
    CPAnimationSequence* animationSequence = [CPAnimationSequence sequenceWithSteps:
                                              [CPAnimationStep for:0.0 animate:^{ _loadingLabel.alpha = 0.5;}],
                                              [self viewSpecificStartAnimation],
                                              [CPAnimationStep for:0.0 animate:^{_loadingLabel.alpha = 1;}],
                                              nil];
	[animationSequence run];
}

- (CPAnimationStep*) viewSpecificStartAnimation {
    CGFloat second = 0.18;
	return [CPAnimationSequence sequenceWithSteps:
			[CPAnimationStep after:0.0 for:second animate:^{ _circleS.alpha = 1; }],
			[CPAnimationStep after:second for:second animate:^{ _circleM.alpha = 1; }],
			[CPAnimationStep after:second for:second animate:^{ _circleL.alpha = 1; }],
			[CPAnimationStep after:second for:second animate:^{ [self setAlpha:0]; }],
			nil];
}

- (void)closeLoadingAnimation{
    [self closeTime];
    _loadingView.hidden = YES;
    _mainView.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
