//
//  IconsCollectionViewCell.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "IconsCollectionViewCell.h"
#import "DetailViewController.h"

@implementation IconsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)selectIcon:(id)sender {
    self.member.thumbnail = self.iconImage.image;
}

@end
