//
//  HYStartApp.m
//  Graduation
//
//  Created by LeeBruce on 17/4/5.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYStartApp.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface HYStartApp ()
@property (strong, nonatomic) MPMoviePlayerController *player;
@end

@implementation HYStartApp

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self SetupVideoPlayer];
}

- (void)SetupVideoPlayer
{
    //    NSString *myFilePath = [[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"];
    //    NSURL *movieURL = [NSURL fileURLWithPath:myFilePath];
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = YES;
    [self.player setControlStyle:MPMovieControlStyleNone];
    self.player.repeatMode = MPMovieRepeatModeOne;
    [self.player.view setFrame:self.view.bounds];
    self.player.view.alpha = 0;
    [UIView animateWithDuration:3 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    
    [self setupLoginView];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [UIView animateWithDuration:3.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}


- (void)enterMainAction:(UIButton *)btn {
    NSLog(@"进入应用");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
