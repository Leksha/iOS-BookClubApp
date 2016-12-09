//
//  Member.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "UIKit/UIKit.h"

@interface Member : NSObject
{
    NSString *_firstName;;
    NSString *_lastName;
    int _numberOfChaptersRead;
}

@property (nonatomic, copy) NSString *memberId;
@property (nonatomic, strong) UIImage *thumbnail;

- (instancetype)initWithName:(NSString *)first last:(NSString *)last;

- (void)setFirstName:(NSString *)str;
- (NSString *)firstName;

- (void)setLastName:(NSString *)str;
- (NSString *)lastName;

- (void)setNumberOfChaptersRead:(int)str;
- (int)numberOfChaptersRead;

@end
