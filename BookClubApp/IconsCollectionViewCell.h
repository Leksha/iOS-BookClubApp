//
//  IconsCollectionViewCell.h
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Member.h"

@interface IconsCollectionViewCell : UICollectionViewCell

@property (nonatomic) Member *member;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end
