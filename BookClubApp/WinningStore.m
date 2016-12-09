//
//  WinningStore.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "WinningStore.h"
#import "MemberStore.h"

@interface WinningStore ()

@property (nonatomic) int max;
@property (nonatomic, strong) Member *winner;

@end

@implementation WinningStore

+ (instancetype)sharedStore {
    static WinningStore *sharedStore = nil;
    
    // We make sure that the code is run exactly once even in a multithreaded app
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] init];
    });
    return sharedStore;
}

// Error if [[MemberStore alloc] init] caller
- (instancetype)init {
    self = [super init];
    if (self) {
        _max = 0;
    }
    return self;
}

- (void)updateWinnerWithMember:(Member *)member {
    NSArray *array = [[MemberStore sharedStore] allMembers];
    int count = (int)array.count;
    for (int i=0; i<count; i++) {
        Member *mem = array[i];
        if (count < mem.numberOfChaptersRead){
            _max = mem.numberOfChaptersRead;
            _winner = mem;
            _member = mem;
        }
    }
}

@end
