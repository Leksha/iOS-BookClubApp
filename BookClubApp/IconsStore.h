//
//  IconsStore.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IconsStore : NSObject

@property (nonatomic, readonly) NSArray *allIcons;

+ (instancetype)sharedStore;

@end
