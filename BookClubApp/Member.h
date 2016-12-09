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
    UIImage *_thumbnail;
}

@property (nonatomic, copy) NSString *memberId;

- (instancetype)initWithName:(NSString *)first last:(NSString *)last;

- (void)setFirstName:(NSString *)str;
- (NSString *)firstName;

- (void)setLastName:(NSString *)str;
- (NSString *)lastName;

- (void)setNumberOfChaptersRead:(int)str;
- (int)numberOfChaptersRead;

- (void)setThumbnail:(UIImage *)image;
- (UIImage *)thumbnail;

@end
