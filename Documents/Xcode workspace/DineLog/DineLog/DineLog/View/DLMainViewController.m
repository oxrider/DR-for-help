//
//  DLMainViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/17/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLMainViewController.h"

@interface DLMainViewController ()

@end

@implementation DLMainViewController

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
    //[UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    //        [_backgroundViewImage setAlpha:1];
    //} completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            for (UIView *view in _frontViewImages) {
                [view setAlpha:1];
            }
        } completion:^(BOOL finished) {
            [self flashButton];
        }];
    //    [self moveBackground];
    //}];
}

-(void) flashButton
{
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_imgNewPersonView setAlpha:0.3];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_imgNewPersonView setAlpha:1];
        } completion:^(BOOL finished) {
            [self flashButton];
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)GoToPickTime:(id)sender {
    NSLog(@"Go to pick time");
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (UIView *view in _frontViewImages) {
            [view setAlpha:0];
        }
    } completion:^(BOOL finished) {
        DLPickAvailableTimeViewController * vc = [[DLPickAvailableTimeViewController alloc] initWithNibName:@"DLPickAvailableTimeViewController" bundle:nil];
        [[self navigationController] pushViewController:vc animated:NO];
    }];
}
@end
