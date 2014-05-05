//
//  TADPageContentViewController.m
//  iOXtremeFinal
//
//  Created by Tania Garrido Salido on 5/4/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "TADPageContentViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface TADPageContentViewController (){
    AVAudioPlayer *audioPlayer;
}

@end

@implementation TADPageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:_songTitle ofType:@"m4a"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)audioPlay{
    [audioPlayer play];
}

-(void)audioStop{
    [audioPlayer stop];
    audioPlayer.currentTime = 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
