//
//  DetailViewController.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "ViewController.h"
#import "Member.h"

@interface DetailViewController : ViewController

- (instancetype)initForNewMember:(BOOL)isNew;

@property (nonatomic, strong) Member *member;

@property (nonatomic, copy) void (^dismissBlock)(void);

- (void)iconSelected:(UIImage *)iconSelected;

@end
