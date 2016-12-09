//
//  DetailViewController.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "DetailViewController.h"
#import "MemberStore.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfChaptersReadTextField;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Member *member = self.member;
    
    self.firstNameTextField.text = member.firstName;
    self.lastNameTextField.text = member.lastName;
    self.numberOfChaptersReadTextField.text = [NSString stringWithFormat:@"%d", member.numberOfChaptersRead];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initForNewMember:(BOOL)isNew {
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                      target:self action:@selector(save:)];
            self.navigationItem.rightBarButtonItem = doneItem;
            
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                        target:self
                                                                                        action:@selector(cancel:)];
            self.navigationItem.leftBarButtonItem = cancelItem;
        }
    }
    return self;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)complete:(id)sender {
    self.member.firstName = _firstNameTextField.text;
    
    self.member.firstName = _firstNameTextField.text;
    self.member.lastName = _lastNameTextField.text;
    self.member.numberOfChaptersRead = [_numberOfChaptersReadTextField.text intValue];
    
//    [[MemberStore sharedStore] updateWinnerWithNewMember:self.member];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

#pragma mark NewItemView

- (void)save:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (void)cancel:(id)sender {
    // If the user cancelled, then remove the BNRItem from the store
    [[MemberStore sharedStore] removeMember:self.member];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

@end
