//
//  Book.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (weak, nonatomic) NSString *bookTitle;
@property (weak, nonatomic) NSString *bookAuthor;
@property (nonatomic) int bookChapters;
@property (nonatomic) NSString *nextMeeting;

+ (instancetype)sharedStore;

@end
