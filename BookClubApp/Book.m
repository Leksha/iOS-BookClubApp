//
//  Book.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (instancetype)sharedStore {
    static Book *sharedStore = nil;
    
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
    return self;
}

@end
