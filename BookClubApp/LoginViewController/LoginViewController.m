//
//  LoginViewController.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

@end

@implementation LoginViewController
- (void)viewWillAppear:(BOOL)animated {
    CGPoint passwordCenter = _passwordField.center;
    CGPoint loginCenter = _loginField.center;
    
    passwordCenter.x -= self.view.bounds.size.width;
    loginCenter.x -= self.view.bounds.size.width;
    
    _passwordField.center = passwordCenter;
    _loginField.center = loginCenter;
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint passwordCenter = _passwordField.center;
        CGPoint loginCenter = _loginField.center;
        
        passwordCenter.x += self.view.bounds.size.width;
        loginCenter.x += self.view.bounds.size.width;
        
        _passwordField.center = passwordCenter;
        _loginField.center = loginCenter;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _goButton.layer.cornerRadius = 15;
    _goButton.clipsToBounds = YES;
    _passwordField.secureTextEntry = YES;
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonClicked:(id)sender {
    CATransition* transition = [CATransition animation];
    transition.duration = 1.0;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromBottom; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}


@end
