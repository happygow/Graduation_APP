//
//  videoDeatilVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/8.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "videoDeatilVC.h"
#import "HYVideoPlayVC.h"

@interface videoDeatilVC ()

// uibutton
@property (nonatomic , strong) UIButton *playBtn;
// uiimageView
@property (nonatomic , strong) UIImageView *coverImageView;
// title
@property (nonatomic , strong) UILabel *videoTitle;
// time label
@property (nonatomic , strong) UILabel *timeDuration;
// coverimg
@property (nonatomic , strong) UIImageView *alphaCoverImg;
// description
@property (nonatomic , strong) UILabel *videoDescription;
@end

@implementation videoDeatilVC

- (BOOL)shouldAutorotate//是否支持旋转屏幕
{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations//支持哪些方向
{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation//默认显示的方向
{
    return UIInterfaceOrientationPortrait;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    //解决 系统自带的侧滑失效问题
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    self.navigationController.navigationBar.hidden = NO;
    
    [self createView];
    
    
    // 向下滑动 返回
    UISwipeGestureRecognizer *recognizerBack = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipBack:)];
    [recognizerBack setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view ]addGestureRecognizer:recognizerBack];
    
}

- (void)swipBack:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


// 页面布局
- (void)createView
{
    CGFloat playBtnW = HYValue(50);
    
    // 首先是 视频页面 添加tap 点击事件  2 为 详情页面 是加在 coverBlurred
    _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(270))];
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:self.model.ImageView] completed:nil];
    [self.view addSubview:_coverImageView];
    
    // 2. 添加个button
    _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(_coverImageView.width / 2 - playBtnW / 2  , _coverImageView.width / 2 - playBtnW * 1.6, playBtnW, playBtnW)];
     [_playBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
     [self.coverImageView addSubview:_playBtn];
    
    // play action
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(_coverImageView.width / 2 - playBtnW / 2  , _coverImageView.width / 2 - playBtnW * 1.6, playBtnW, playBtnW)];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    // 2 详情页面 cover
    _alphaCoverImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, _coverImageView.bottom, HYScreenWidth, HYScreenHeight - _coverImageView.height )];
    [_alphaCoverImg sd_setImageWithURL:[NSURL URLWithString:self.model.alphaCoverImg] completed:nil];
    [self.view addSubview:_alphaCoverImg];
    
    // title
    _videoTitle = [[UILabel alloc] initWithFrame:CGRectMake(HYValue(10), HYValue(15), HYScreenWidth - HYValue(20), HYValue(20))];
    _videoTitle.textAlignment = NSTextAlignmentLeft;
    _videoTitle.text = self.model.videoTitle;
    [_videoTitle setFont:[UIFont systemFontOfSize:16]];
    [_videoTitle setTextColor:[UIColor whiteColor]];
    [_alphaCoverImg addSubview:_videoTitle];
    
    
    // time duration
    _timeDuration = [[UILabel alloc] initWithFrame:CGRectMake(_videoTitle.x, _videoTitle.bottom + HYValue(10), _videoTitle.width, HYValue(15))];
    [_timeDuration setTextColor:[UIColor whiteColor]];
    [_timeDuration setFont:[UIFont systemFontOfSize:14]];
    _timeDuration.text = [NSString stringWithFormat:@"时长 : %@",[HYTime timeStrFormTime:self.model.duration]] ;
    [_alphaCoverImg addSubview:_timeDuration];
    
    
    // line
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _timeDuration.bottom + HYValue(10), HYScreenWidth, HYValue(1))];
    line.backgroundColor = [UIColor whiteColor];
    [_alphaCoverImg addSubview:line];
    
    
    // description
    _videoDescription = [[UILabel alloc] initWithFrame:CGRectMake(_videoTitle.x, line.bottom + HYValue(15), _videoTitle.width, HYValue(200))];
    [_videoDescription setTextColor:[UIColor whiteColor]];
    // 这句很重要哦 自动换行
    [_videoDescription setNumberOfLines:0];
    [_videoDescription setText:self.model.videoDescription];
    [_videoDescription sizeToFit];//    这个可以尺寸自适应
    [_videoDescription setFont: [UIFont systemFontOfSize:15]];
   
    
    
    // 行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.model.videoDescription];
    NSMutableParagraphStyle *pagestyle = [[NSMutableParagraphStyle alloc]init];
    [pagestyle setLineSpacing:7];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:pagestyle range:NSMakeRange(0, [self.model.videoDescription length])] ;
    [_videoDescription setAttributedText:attributedString];
    [_alphaCoverImg addSubview:_videoDescription];
    
    
    
    // back btn
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(HYValue(10), HYValue(30), HYValue(25), HYValue(25))];
    backBtn.backgroundColor = [UIColor lightGrayColor];
    backBtn.layer.cornerRadius = 15;
    backBtn.layer.masksToBounds = YES;
    [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [_coverImageView addSubview:backBtn];
    
    UIButton *btnClicked = [[UIButton alloc] initWithFrame:CGRectMake(5, HYValue(20), HYValue(30), HYValue(30))];
    [btnClicked addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClicked];
    
    
    
}


- (void)playVideo
{
    HYVideoPlayVC *videoplay = [[HYVideoPlayVC alloc] init];
    videoplay.UrlString = self.model.playUrl;
    videoplay.titleStr = self.model.videoTitle;
    videoplay.duration = [self.model.duration floatValue];
    [self showDetailViewController:videoplay sender:nil];
}

- (void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
