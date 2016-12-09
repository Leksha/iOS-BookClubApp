//
//  WinningViewController.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "WinningViewController.h"
#import "WinningStore.h"

@interface WinningViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dancingWinner;

@end

@implementation WinningViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"trophy"];
        self.tabBarItem.title = @"Current Winner";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [[WinningStore sharedStore] updateWinnerWithMember:self.member];
    self.winningMember.text = [WinningStore sharedStore].member.firstName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load images
    NSArray *imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                            @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                            @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                            @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    // Slow motion animation
//    UIImageView *slowAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 95, 86, 193)];
    UIImageView *slowAnimationImageView = _dancingWinner;
    slowAnimationImageView.animationImages = images;
    slowAnimationImageView.animationDuration = 0.8;
    
    [self.view addSubview:slowAnimationImageView];
    [slowAnimationImageView startAnimating];
    
    
//    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
//    animationImageView.animationImages = images;
//    animationImageView.animationDuration = 0.5;
//    
//    [self.view addSubview:animationImageView];
//    [animationImageView startAnimating];
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
