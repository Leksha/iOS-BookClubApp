//
//  Member.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "Member.h"

@implementation Member

- (instancetype)init {
    return [self initWithName:@"First" last:@"Last"];
}

- (instancetype)initWithName:(NSString *)first last:(NSString *)last {
    self = [super init];
    if (self) {
        _firstName = first;
        _lastName = last;
        
        // Each member will have an NSUUID
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *id = [uuid UUIDString];
        _memberId = id;
    }
    return self;
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"Member: %@ %@", _firstName, _lastName];
}


#pragma mark - Setters Getters

- (void)setFirstName:(NSString *)str {
    _firstName = str;
}

- (void)setLastName:(NSString *)str {
    _lastName = str;
}

-(void)setNumberOfChaptersRead:(int)str {
    _numberOfChaptersRead = str;
}

- (NSString *)firstName {
    return _firstName;
}

- (NSString *)lastName {
    return _lastName;
}

- (int)numberOfChaptersRead {
    return _numberOfChaptersRead;
}

- (void)setThumbnail:(UIImage *)image {
    _thumbnail = image;
}

- (UIImage *)thumbnail {
    return _thumbnail;
}

#pragma mark - Encoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _firstName = [aDecoder decodeObjectForKey:@"firstName"];
        _lastName = [aDecoder decodeObjectForKey:@"lastNumber"];
        self.thumbnail = [aDecoder decodeObjectForKey:@"thumbnail"];
        _numberOfChaptersRead = [aDecoder decodeIntForKey:@"chapters"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_firstName forKey:@"firstName"];
    [aCoder encodeObject:_lastName forKey:@"lastNumber"];
    [aCoder encodeObject:self.thumbnail forKey:@"thumbnail"];
    [aCoder encodeInt:_numberOfChaptersRead forKey:@"chapters"];
}


@end
