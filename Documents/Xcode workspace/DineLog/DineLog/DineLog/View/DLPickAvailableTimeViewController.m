//
//  DLPickAvailableTimeViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/18/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLPickAvailableTimeViewController.h"

@interface DLPickAvailableTimeViewController ()

@end

@implementation DLPickAvailableTimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (UIView * view in _frontViewCollection) {
            [view setAlpha:1];
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
