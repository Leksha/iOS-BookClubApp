//
//  BookViewController.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "BookViewController.h"
#import "Book.h"

@interface BookViewController ()

@property (weak, nonatomic) IBOutlet UITextField *bookTitleText;
@property (weak, nonatomic) IBOutlet UITextField *bookAuthorText;
@property (weak, nonatomic) IBOutlet UITextField *bookChaptersText;


@end

@implementation BookViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _currentBook = [Book sharedStore];
        self.tabBarItem.title = @"Book Selected";
        self.tabBarItem.image = [UIImage imageNamed:@"book-bookmark"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    Book *book = [Book sharedStore];
    book.bookTitle = self.bookTitleText.text;
    book.bookAuthor = self.bookAuthorText.text;
    book.bookChapters = [self.bookChaptersText.text intValue];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 1.0;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionReveal; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromRight; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop,
    
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
    [self.tabBarController setSelectedIndex:1];
}

@end
