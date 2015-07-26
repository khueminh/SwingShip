//
//  ViewController.m
//  SwingShip
//
//  Created by Nguyen Minh Khue on 7/22/15.
//  Copyright (c) 2015 Nguyen Minh Khue. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    UIImageView *ship;
    UIImageView *sea1, *sea2, *sea3, *sea4;
    AVAudioPlayer* audioPlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self drawShipAndSea];
    [self animateShip];
    [self animateSea];
    [self playSong];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) drawShipAndSea {
    sea1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea01.png"]];
    sea1.frame = self.view.bounds;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea02.png"]];
    sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
    
    sea3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea03.png"]];
    sea3.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea3];
    
    sea4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea04.png"]];
    sea4.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea4];
    
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pirate_ship_new.png"]];
    ship.center = CGPointMake(200, 500);
    [self.view addSubview:ship];
}

-(void) animateShip {
    [UIView animateWithDuration:1 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.08);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1
                         animations:^{
                             ship.transform = CGAffineTransformMakeRotation(0.08);
                         } completion:^(BOOL finished) {
                             [self animateShip];
                         }];
    }];
}

- (void) animateSea {
    [UIView animateWithDuration:10
                     animations:^{
                         //Dich sang trai
                         sea1.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         //Man hinh chinh
                         sea2.frame = self.view.bounds;
                     } completion:^(BOOL finished) {
                         //Vi tri cho ben phai
                         sea1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                         
                         [UIView animateWithDuration:10 animations:^{
                             //Dich sang ben trai
                             sea2.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             
                             //Man hinh chinh
                             sea3.frame = self.view.bounds;
                         } completion:^(BOOL finished) {
                             //Vi tri cho ben phai
                             sea2.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                             
                             [UIView animateWithDuration:10 animations:^{
                                 //Dich sang ben trai
                                 sea3.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                 
                                 //Man hinh chinh
                                 sea4.frame = self.view.bounds;
                             } completion:^(BOOL finished) {
                                 //Vi tri cho ben phai
                                 sea3.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                 
                                 [UIView animateWithDuration:10 animations:^{
                                     //Dich sang ben trai
                                     sea4.frame = CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                     
                                     //Man hinh chinh
                                     sea1.frame = self.view.bounds;
                                 } completion:^(BOOL finished) {
                                     //Vi tri cho ben phai
                                     sea4.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
                                     
                                     [self animateSea];
                                 }];
                             }];
                         }];
                         
                     }];
}

- (void) playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Sharazan" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}
- (void) viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}

@end
