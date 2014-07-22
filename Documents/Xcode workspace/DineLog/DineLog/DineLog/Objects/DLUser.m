//
//  DLUser.m
//  DineLog
//
//  Created by Tengyu Liu on 6/24/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLUser.h"

@implementation DLUser

@synthesize email;
@synthesize uid;
@synthesize interest;
@synthesize match;
@synthesize gender;
@synthesize description;
@synthesize fbid;

static DLUser * instance = nil;

+(DLUser*) currentUser {
    @synchronized(self)
    {
        if (instance == nil)
            instance = [DLUser new];
    }
    return instance;
}

@end
