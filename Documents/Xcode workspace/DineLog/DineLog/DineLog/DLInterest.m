//
//  DLInterest.m
//  DineLog
//
//  Created by Tengyu Liu on 6/24/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLInterest.h"

@implementation DLInterest

static DLInterest* instance = nil;

+(DLInterest*) interest {
    @synchronized(self)
    {
        if (instance == nil)
            instance = [DLInterest new];
    }
    return instance;
}

@end
