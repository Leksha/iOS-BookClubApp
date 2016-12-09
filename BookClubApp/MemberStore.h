//
//  MemberStore.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface MemberStore : NSObject

@property (nonatomic, readonly) NSArray *allMembers;

+ (instancetype)sharedStore;
- (Member *)createMember;
- (void)removeMember:(Member *)member;

- (void)moveMemberAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (BOOL)saveChanges;

@end
