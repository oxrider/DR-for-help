//
//  DLVerificationViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/14/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLVerificationViewController.h"

@interface DLVerificationViewController ()

@end

@implementation DLVerificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        for (UIView *view in _allViewCollection) {
            if (view != _dotsView)
            {
                [view setFrame:CGRectMake(view.frame.origin.x + 30,
                                         view.frame.origin.y,
                                         view.frame.size.width,
                                          view.frame.size.height)];
                [view setAlpha:0];
            }
        }
        [_textField setTintColor:DINELOG_RED];
        [_emailField setTintColor:DINELOG_RED];

        [_textField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [_emailField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [[_textResend titleLabel] setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [[_emailResend titleLabel] setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [[_textCont titleLabel] setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [[_emailCont titleLabel] setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
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
        for (UIView *view in _Veri1Collection) {
            [view setAlpha:1];
            [view setFrame:CGRectMake(view.frame.origin.x - 30,
                                      view.frame.origin.y,
                                      view.frame.size.width,
                                      view.frame.size.height)];
        }
    } completion:^(BOOL finished) {
        [_textResend addTarget:self action:@selector(textResendFunc) forControlEvents:UIControlEventTouchUpInside];
        [_textCont addTarget:self action:@selector(textContFunc) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button functions
-(void) textResendFunc
{
    NSLog(@"Text Verification Code resent");
}

-(void) textContFunc
{
    for (UIView *view in _Veri1Collection) {
        [view removeFromSuperview];
    }
    [_completionBoard setAlpha:1];
    [_completionBoard setFrame:CGRectMake(_completionBoard.frame.origin.x - 30,
                                          _completionBoard.frame.origin.y,
                                          _completionBoard.frame.size.width,
                                          _completionBoard.frame.size.height)];
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (UIView *view in _Veri2Collection) {
            [view setAlpha:1];
            [view setFrame:CGRectMake(view.frame.origin.x - 30,
                                      view.frame.origin.y,
                                      view.frame.size.width,
                                      view.frame.size.height)];
        }
        [_dotsView setImage:[UIImage imageNamed:@"3rd three dots.png"]];
    } completion:^(BOOL finished) {
        [_emailResend addTarget:self action:@selector(emailResendFunc) forControlEvents:UIControlEventTouchUpInside];
        [_emailCont addTarget:self action:@selector(emailContFunc) forControlEvents:UIControlEventTouchUpInside];
    }];
}

-(void) emailResendFunc
{
    NSLog(@"Email Verification Code resent");
}

-(void) emailContFunc
{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (UIView *view in _allViewCollection) {
            [view setAlpha:0];
            [view setFrame:CGRectMake(view.frame.origin.x - 30,
                                      view.frame.origin.y,
                                      view.frame.size.width,
                                      view.frame.size.height)];
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            [self.view setBackgroundColor:DINELOG_WHITE];
        } completion:^(BOOL finished) {
            // Push in new view
            DLExpandableTableViewController *vc = [[DLExpandableTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }];
    }];
}

#pragma mark TextField Animations
-(void) screenMoveUpForLength:(CGFloat) fp
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view setFrame:CGRectMake(0, -fp, SCREEN_WIDTH, SCREEN_HEIGHT)];
                     } completion:^(BOOL finished) {
                     }];
}

-(void) screenMoveBack
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                     } completion:^(BOOL finished) {
                     }];
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    CGFloat offset = textField.frame.origin.y - SCREEN_HEIGHT/2;
    if (offset < 0) offset = 0;
    [self screenMoveUpForLength:offset];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self screenMoveBack];
    [textField resignFirstResponder];
    return NO;
}

-(void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    NSArray *subviews = [self.view subviews];
    for (id objects in subviews) {
        if ([objects isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objects;
            if ([objects isFirstResponder]) {
                [theTextField resignFirstResponder];
                [self screenMoveBack];
            }
        }
    }
}

@end
