//
//  MemberStore.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "MemberStore.h"

@interface MemberStore ()

@property (nonatomic) NSMutableArray *privateMembers;

@end


@implementation MemberStore

+ (instancetype)sharedStore {
    static MemberStore *sharedStore = nil;
    
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
                                   reason:@"Use +[MemberStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        _privateMembers = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the aray hadn't been saved previously, create a new empty one
        if (!_privateMembers) {
            _privateMembers = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)allMembers {
    return self.privateMembers;
}

- (Member *)createMember {
    Member *member = [[Member alloc] init];
    
    [self.privateMembers insertObject:member atIndex:0];
    //    [self.privateItems addObject:item];
    return member;
}

- (void)removeMember:(Member *)member {
    [self.privateMembers removeObjectIdenticalTo:member];
}

- (void)moveMemberAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    // Get pointer to object being moved so you can re-insert it
    Member *member = self.privateMembers[fromIndex];
    
    // remove item from array
    [self.privateMembers removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new location
    [self.privateMembers insertObject:member atIndex:toIndex];
}

#pragma mark Archive

- (NSString *)itemArchivePath {
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"members.archive"];
}

- (BOOL)saveChanges {
    NSString *path = [self itemArchivePath];
    
    // Return YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateMembers
                                       toFile:path];
}



@end
