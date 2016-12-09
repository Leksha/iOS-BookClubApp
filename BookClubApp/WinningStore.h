//
//  WinningStore.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface WinningStore : NSObject

@property (nonatomic, strong) Member *member;

+ (instancetype)sharedStore;

- (void)updateWinnerWithMember:(Member *)member;

@end
