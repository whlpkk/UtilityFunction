//
//  MovieViewController.m
//  MoviePlayer
//
//  Created by Crystal on 15-6-18.
//  Copyright (c) 2015年 Crystal. All rights reserved.
//

#import "MovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController ()

//没有用到MPMoviePlayerViewController，而是有一个普通的UIViewController
//来盛装
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end

@implementation MovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createNav];

    //用NSUserDefaults来保存上次播放的时间
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"lastProgress"]) {
        //double用%f就可以
        [[NSUserDefaults standardUserDefaults]setObject:@"lastProgress" forKey:[NSString stringWithFormat:@"%f", 0.0]];
    }

    double pro = [[[NSUserDefaults standardUserDefaults]objectForKey:@"lastProgress"]doubleValue];
    int min = pro / 60;
    int sec = (int)pro % 60;
    NSLog(@"viewDidLoad:%d:%d", min, sec);

    //在每次显示之前都会触发这个通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieLoadStateChange:)
                                                 name:MPMoviePlayerReadyForDisplayDidChangeNotification
                                               object:self.moviePlayer
    ];


    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(enterBackgroundHandle) name:@"enterBackground" object:nil];

    //本地的
    NSString *localURL = [[NSBundle mainBundle]pathForResource:@"video01" ofType:@"mp4"];
    self.moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:localURL]];
    [self.moviePlayer setControlStyle:MPMovieControlStyleDefault];

    [self.moviePlayer setFullscreen:YES];

    [self.moviePlayer.view setFrame:self.view.bounds];

    self.moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.moviePlayer.shouldAutoplay = YES;

    self.moviePlayer.view.layer.borderWidth = 2.0f;
    self.moviePlayer.view.layer.borderColor = [[UIColor greenColor]CGColor];

    //设置开始播放时间为上次的进度
    self.moviePlayer.currentPlaybackTime = [[[NSUserDefaults standardUserDefaults]objectForKey:@"lastProgress"]doubleValue];

    //关闭所有其他的音频和视频会话，避免混乱
    //如果没有准备好时，会自动调用
    [self.moviePlayer prepareToPlay];
    [self.view addSubview:self.moviePlayer.view];
}

- (void)movieLoadStateChange:(NSNotification *)notification
{
    double progress = [[[NSUserDefaults standardUserDefaults]objectForKey:@"lastProgress"]doubleValue];
    //分秒
    int min = progress / 60;
    int sec = (int)progress % 60;

    NSLog(@"触发-》%d:%d", min, sec);



    [self.moviePlayer setCurrentPlaybackTime:[[[NSUserDefaults standardUserDefaults]objectForKey:@"lastProgress"]doubleValue]];
    //如果播放到一半，没有暂停，就直接home，或者返回上一页
    //再回来时也要自动播放
    [self.moviePlayer play];
}

- (void)createNav
{
    UIButton *backBT = [UIButton buttonWithType:UIButtonTypeCustom];

    backBT.frame = CGRectMake(0, 0, 11, 20);
    [backBT setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backBT addTarget:self action:@selector(backToLastVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBT];
}

- (void)backToLastVC
{
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f", self.moviePlayer.currentPlaybackTime] forKey:@"lastProgress"];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- 程序进入后台时，记录当前的播放时间
- (void)enterBackgroundHandle
{
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%f", self.moviePlayer.currentPlaybackTime] forKey:@"lastProgress"];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //判断是否是横屏
//    BOOL landscape=UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
//    if (landscape) {
//        //横屏布局
//    }else{
//        //竖屏布局
//    }
    //横竖屏self.view的宽高是反过来的
    //而我设置时用到的self.view是旋转之前状态的宽高
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width)];
}

- (void)didReceiveMemoryWarning
{
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
