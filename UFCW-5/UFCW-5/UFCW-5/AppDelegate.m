//
//  AppDelegate.m
//  UFCW-5
//
//  Created by Avialdo on 18/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Constants.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        // use registerUserNotificationSettings
        
       /* [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [application registerForRemoteNotifications]; */
        
    } else {
        // use registerForRemoteNotifications
        
      /*  [application registerForRemoteNotificationTypes:
                  (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
   */ }
    
    [Parse setApplicationId:@"Lr8VBQHTUyzw4RoFpcyHQnCcHJAQb1PPhBVzDtqK"
                  clientKey:@"CHhHCo1TO0shdXvmhFywuNbFDVpalWvj9s6FqcM2"];
    // Register for Push Notitications
    //-- Set Notification
    
    //for back button text colour//
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:NAV_TITLE_RED_COLOR/255.0 green:NAV_TITLE_GREEN_COLOR/255.0 blue:NAV_TITLE_BLUE_COLOR/255.0 alpha:1.0]];
    
    //for navigation bar colour//
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:NAV_RED_COLOR/255.0 green:NAV_GREEN_COLOR/255.0 blue:NAV_BLUE_COLOR/255.0 alpha:1.0]];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
  
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

@end
