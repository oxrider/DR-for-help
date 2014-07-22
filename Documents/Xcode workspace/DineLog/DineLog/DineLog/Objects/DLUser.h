//
//  DLUser.h
//  DineLog
//
//  Created by Tengyu Liu on 6/24/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLInterest.h"
#import "DLMatch.h"

typedef enum {
    MALE = 0,
    FEMALE = 1
} _Gender;

@interface DLUser : NSObject

@property NSString *    email;
@property int           uid;
@property DLInterest *  interest;
@property DLMatch *     match;
@property _Gender       gender;
@property NSString *    description;
@property NSString *    fbid;
@property NSString *    headPicName;

+(DLUser*) currentUser;

@end
