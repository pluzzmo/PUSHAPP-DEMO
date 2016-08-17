//
//  NotificationModel.h
//  APNSTest
//
//  Created by macbook air on 30/10/2014.
//  Copyright (c) 2014 Jebabli Med Amine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushappNotification : NSObject<NSCoding>

@property (nonatomic, strong) NSString *notificationID;
@property (nonatomic, strong) NSString *notificationAlert;
@property (nonatomic, strong) NSNumber *notificationBadge;
@property (nonatomic, strong) NSString *notificationReceiptDate;
@property (nonatomic, strong) NSString *notificationViewDate;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *latitude;
@property BOOL viewed;
@property BOOL sync;

/*! Init notification object based on a payload
 \param payload the payload dictionary
 */
-(id)initWithPaylod:(NSDictionary*)payload;
@end
