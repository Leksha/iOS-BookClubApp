//
//  IconsCollectionViewController.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Member.h"

@interface IconsCollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) Member *member;

@end
