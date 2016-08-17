//
//  PushAppCore.h
//  PushApp
//
//  Created by macbook air on 20/01/2015.
//  Copyright (c) 2015 idealump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PushappNotification.h"

/*! PushApp execution mode
 */
typedef enum : NSUInteger {
    PROD,
    DEV,
} PUSHAPPMODE;

@interface PushAppCore : NSObject

/*! Get a unique instance from the PushAppCore
 */

+ (PushAppCore*) sharedInstance;
/*! Init
 */
- (instancetype)init;

/*! Register the device based on the Application ID and the device token
 \param appID the application ID
 \param deviceToken the device token
 \param useLocation the use of location and background task preference
 */
-(void)registerDevice:(NSString*)appID deviceToken:(NSData*)deviceToken mode:(PUSHAPPMODE)mode useLocation:(BOOL)useLocation;

/*! Register a user based user dictionary information
 \param userObject user dictionary information
 */
-(void)registerUser:(NSDictionary*)userObject;

-(void)unregisterDevice:(UIApplication*)application;

/*! Check if the application is launched after clicking on a badge
 \param userInfo
 \returns the state
 */
-(PushappNotification*)isApplicationLaunchedWithPushNotification:(NSDictionary*)userInfo;

/*! Handle a received notification
 \param userInfo
 */
-(PushappNotification*)notificationReceived:(NSDictionary*)userInfo;
-(PushappNotification *)notificationReceived:(UIApplication*)application userInfo:(NSDictionary *)userInfo;

/*! Return an array with stored notifications
 */
-(NSMutableArray*)getNotificationsArray;

/*! Mark a notification as viewed
 \param notificationID
 */
-(void)setNotificationViewed:(NSString*)notificationID;

/*! Increment Notifications received
 */
-(void)incrementReceivedNotificationsNumber;

/*! Increment Notifications viewed
 */
-(void)incrementViewedNotificationsNumber;

/*! Remove all stored notifications
 \param userInfo
 */
-(void)clearNotifications;

/*! Received Notifications
 */
-(NSNumber*)getReceivedNotificationsNumber;

/*! Viewed Notifications
 */
-(NSNumber*)getViewedNotificationsNumber;

/*! Reset Received Notifications
 */
-(void)resetViewedNotificationsNumber;

@end

/*! Notification posted the location is updated
 */
extern NSString *const PushAppLocationUpdatedNotification;

/*! Notification posted the user info is updated
 */
extern NSString * const PushAppUserUpdatedNotification;

/*! Notification posted the device data is updated
 */
extern NSString * const PushAppDeviceDataUpdatedNotification;

/*! Notification posted a notification is received
 */
extern NSString * const PushAppNotificationReceived;