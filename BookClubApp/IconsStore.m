//
//  IconsStore.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "IconsStore.h"

@interface IconsStore ()

@property (nonatomic) NSArray *privateIcons;

@end

@implementation IconsStore


+ (instancetype)sharedStore {
    static IconsStore *sharedStore = nil;
    
    // We make sure that the code is run exactly once even in a multithreaded app
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    return sharedStore;
}

// Error if [[MemberStore alloc] init] caller
- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[Icons sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        _privateIcons = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the aray hadn't been saved previously, create a new empty one
        if (!_privateIcons) {
            _privateIcons = [[NSMutableArray alloc] init];
            _privateIcons = @[ [UIImage imageNamed:@"pikachuIcon"],
                               [UIImage imageNamed:@"togepiIcon"],
                               [UIImage imageNamed:@"starIcon"],
                               [UIImage imageNamed:@"pokemon1"],
                               [UIImage imageNamed:@"pokemon2"],
                               [UIImage imageNamed:@"pokemon3"],
                               [UIImage imageNamed:@"pokemon5"],
                               [UIImage imageNamed:@"pokemon6"],
                               [UIImage imageNamed:@"pokemon7"],
                               [UIImage imageNamed:@"pokemon8"],
                               [UIImage imageNamed:@"pokemon9"]
                               ];
        }
    }
    return self;
}

- (NSArray *)allIcons {
    return self.privateIcons;
}

#pragma mark Archive

- (NSString *)itemArchivePath {
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"icons.archive"];
}

- (BOOL)saveChanges {
    NSString *path = [self itemArchivePath];
    
    // Return YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateIcons
                                       toFile:path];
}


@end
