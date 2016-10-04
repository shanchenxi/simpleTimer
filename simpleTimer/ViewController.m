//
//  ViewController.m
//  simpleTimer
//
//  Created by 单晨曦 on 2016/10/4.
//  Copyright © 2016年 单晨曦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *timer;
    BOOL isPlaying;
    double num;
    
}
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UIButton *playing;
@property (weak, nonatomic) IBOutlet UIButton *pause;
@property (weak, nonatomic) IBOutlet UIButton *reset;
- (IBAction)playing:(UIButton *)sender;
- (IBAction)pause:(UIButton *)sender;
- (IBAction)reset:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     num = 0.0;
    
    //double类型转成string类型
    NSString *numString = [NSString stringWithFormat:@"%.1f", num];
    
    self.display.text = numString;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)timerFire:(id)userinfo {
    
    num = num + 0.1;
    NSString *newNum = [NSString stringWithFormat:@"%.1f", num];
    self.display.text = newNum;
}


- (IBAction)playing:(id)sender {
    //创建定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(timerFire:)
                                           userInfo:nil
                                            repeats:YES];
    [timer fire];
    
    _playing.enabled = NO;
    _pause.enabled = YES;
    isPlaying = YES;
}

- (IBAction)pause:(id)sender {

    _playing.enabled = YES;
    _pause.enabled = NO;
    [timer invalidate];
    timer = nil;
    isPlaying = NO;
}

- (IBAction)reset:(id)sender {

    [timer invalidate];
    isPlaying = NO;
    num = 0.0;
    NSString *setNum = [NSString stringWithFormat:@"%.1f", num];
    self.display.text = setNum;
    _playing.enabled = YES;
    _pause.enabled = YES;
}
@end
