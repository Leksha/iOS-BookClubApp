//
//  AppDelegate.m
//  BookClubApp
//
//  Created by Leksha Ramdenee on 2016-12-09.
//  Copyright © 2016 Leksha. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MembersTableViewController.h"
#import "BookViewController.h"
#import "IconsCollectionViewController.h"
#import "WinningViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navController = [[UINavigationController alloc] init];
    
    MembersTableViewController *membersTableVC = [[MembersTableViewController alloc] init];
    UINavigationController *membersNavController = [[UINavigationController alloc] initWithRootViewController:membersTableVC];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    BookViewController *bookViewController = [[BookViewController alloc] init];
    WinningViewController *winningController = [[WinningViewController alloc] init];
    tabBarController.viewControllers = @[bookViewController ,membersNavController, winningController];
    
    LoginViewController *loginScreenController = [[LoginViewController alloc] init];
    

    [navController pushViewController:tabBarController animated:YES];
    [navController pushViewController:loginScreenController animated:YES];
    
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
