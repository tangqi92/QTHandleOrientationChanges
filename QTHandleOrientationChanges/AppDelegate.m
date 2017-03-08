//
//  AppDelegate.m
//  QTHandleOrientationChanges
//
//  Created by Tang Qi on 06/03/2017.
//  Copyright © 2017 Tang. All rights reserved.
//

#import "AppDelegate.h"
#import "QTViewController.h"
#import <FLEX/FLEX.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    QTViewController *viewController = [[QTViewController alloc] init];
    viewController.title = @"QTViewController";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // 在此处开启，则在 - (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator 中使用 [UIScreen mainScreen].bounds.size 获取的为旋转后的值。
//    [[FLEXManager sharedManager] showExplorer];

    self.window.rootViewController = navigationController;
    // 在此处开启，则在 - (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator 中使用 [UIScreen mainScreen].bounds.size 获取的为旋转前的值。
    [[FLEXManager sharedManager] showExplorer];

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
