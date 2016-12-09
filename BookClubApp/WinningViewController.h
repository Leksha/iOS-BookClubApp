//
//  WinningViewController.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Member.h"

@interface WinningViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *winningMember;
@property (nonatomic, strong) Member *member;
@property (weak, nonatomic) IBOutlet UILabel *winningChapters;

@end
