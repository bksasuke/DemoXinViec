//
//  PlayMusicScreen.m
//  ZingRadio_Clone
//
//  Created by tuan.suke on 12/11/15.
//  Copyright © 2015 Appcoda. All rights reserved.
//

#import "PlayMusicScreen.h"

@interface PlayMusicScreen ()
@property (weak, nonatomic) IBOutlet UIImageView *SongImage;
@property (weak, nonatomic) IBOutlet UILabel *SongTitle;
@property (weak, nonatomic) IBOutlet UISlider *SongCurrentTime;

@property (weak, nonatomic) IBOutlet UILabel *SongDuration;
@property (weak, nonatomic) IBOutlet UILabel *SongCurrentTimeValue;

@property (weak, nonatomic) IBOutlet UIButton *PlayButton;
@property (weak, nonatomic) IBOutlet UIButton *NextButton;
@property (weak, nonatomic) IBOutlet UIButton *VolumeButton;
@end

@implementation PlayMusicScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
}





@end
