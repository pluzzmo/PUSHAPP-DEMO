//
//  AppDelegate.m
//  Demo
//
//  Created by Ramzi BOUKERI on 16/08/2016.
//  Copyright © 2016 Ramzi BOUKERI. All rights reserved.
//

#import "AppDelegate.h"
#import <PushApp/PushApp.h>
#define kDeviceToken @"deviceToken"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Push Notifications
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        // iOS8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [application registerForRemoteNotifications];
    } else {
        // <iOS8 Notifications
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Remote Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"My token is: %@", deviceToken);
    [[[UIAlertView alloc] initWithTitle:@"Token" message:[NSString stringWithFormat:@"%@", deviceToken] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:kDeviceToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Failed to get token, error: %@", error);
    [[[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"%@", error.description] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    [[PushAppCore sharedInstance] notificationReceived:userInfo];
    NSLog(@"didReceiveRemoteNotification : %@", userInfo);
    NSString *message = [[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
    UIAlertView *notificationAlert = [[UIAlertView alloc] initWithTitle:@"Notification Received" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [notificationAlert show];
}

@end
