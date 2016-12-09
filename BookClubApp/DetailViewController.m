//
//  DetailViewController.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "DetailViewController.h"
#import "MemberStore.h"
#import "IconsCollectionViewController.h"
#import "WinningStore.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfChaptersReadTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cameraButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

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
    self.iconImage.image = member.thumbnail;
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
                                                                                      target:self action:@selector(complete:)];
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
    _member.firstName = _firstNameTextField.text;
    _member.lastName = _lastNameTextField.text;
    _member.numberOfChaptersRead = [_numberOfChaptersReadTextField.text intValue];
    _member.thumbnail = _iconImage.image;
    [WinningStore sharedStore].member = self.member;
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

- (IBAction)selectIcon:(id)sender {
    
    // Needs a source type and a delegate
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    IconsCollectionViewController *iconsCollectionVC = [[IconsCollectionViewController alloc]
                                                        initWithCollectionViewLayout:flowLayout];
    iconsCollectionVC.member = self.member;
    iconsCollectionVC.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popController = [iconsCollectionVC popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = _cameraButton;
    
//    [self.navigationController presentViewController:iconsCollectionVC animated:YES completion:nil];
    [self presentViewController:iconsCollectionVC animated:YES completion:nil];

}

- (void)iconSelected:(UIImage *)iconSelected {
    self.iconImage.image = iconSelected;
}

@end
