//
//  DLLogInViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/8/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLLogInViewController.h"

@interface DLLogInViewController ()

@end

@implementation DLLogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if ([[self navigationController] respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            [[[self navigationController] interactivePopGestureRecognizer] setEnabled:YES];
        }
        // Custom initialization
        stopAnimation = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpInitialPositions];
    
    [self openAnimations];
    
    [_loginButton addTarget:self action:@selector(LogIn) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)LogIn
{
    stopAnimation = YES;
    DLMainBackgroundViewController *vc = [[DLMainBackgroundViewController alloc] initWithNibName:@"DLMainBackgroundViewController" bundle:nil];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_arrowView_1 setAlpha:0];
        [_arrowView_2 setAlpha:0];
        [_arrowView_3 setAlpha:0];
        [_inputPlateView setAlpha:0];
        [_btnPlateView setAlpha:0];
        [_netidField setAlpha:0];
        [_passwordField setAlpha:0];
        [_forgotButton setAlpha:0];
        [_loginButton setAlpha:0];
        [_sunView setAlpha:0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.view setBackgroundColor:DINELOG_WHITE];
        } completion:^(BOOL finished) {
            [self.navigationController pushViewController:vc animated:NO];
        }];
    }];
}

#pragma mark view intro
- (void)setUpInitialPositions
{
    [_arrowView_1 setFrame:CGRectMake(50, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_arrowView_2 setFrame:CGRectMake(50, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_arrowView_3 setFrame:CGRectMake(50, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_inputPlateView setFrame:CGRectMake(50, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_btnPlateView setFrame:CGRectMake(50, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [_netidField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:18]];
    [_passwordField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:18]];
    [_loginButton.titleLabel setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:15]];
    [_forgotButton.titleLabel setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:15]];
    
    
    [_sunView setFrame:CGRectMake(
                                     _sunView.frame.origin.x + 50,
                                     _sunView.frame.origin.y,
                                     _sunView.frame.size.width,
                                     _sunView.frame.size.height)];
    [_netidField setFrame:CGRectMake(
                                     _netidField.frame.origin.x + 50,
                                     _netidField.frame.origin.y,
                                     _netidField.frame.size.width,
                                     _netidField.frame.size.height)];
    [_passwordField setFrame:CGRectMake(
                                        _passwordField.frame.origin.x + 50,
                                        _passwordField.frame.origin.y,
                                        _passwordField.frame.size.width,
                                        _passwordField.frame.size.height)];
    [_forgotButton setFrame:CGRectMake(
                                       _forgotButton.frame.origin.x + 50,
                                       _forgotButton.frame.origin.y,
                                       _forgotButton.frame.size.width,
                                       _forgotButton.frame.size.height)];
    [_loginButton setFrame:CGRectMake(
                                      _loginButton.frame.origin.x + 50,
                                      _loginButton.frame.origin.y,
                                      _loginButton.frame.size.width,
                                      _loginButton.frame.size.height)];
    
    [_netidField setTintColor:DINELOG_RED];
    [_passwordField setTintColor:DINELOG_RED];
    
}

- (void)openAnimations
{
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [_arrowView_1 setAlpha:1];
                         [_arrowView_2 setAlpha:1];
                         [_arrowView_3 setAlpha:1];
                         [_sunView setAlpha:1];
                         [_inputPlateView setAlpha:1];
                         [_btnPlateView setAlpha:1];
                         [_arrowView_1 setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                         [_arrowView_2 setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                         [_arrowView_3 setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                         [_inputPlateView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                         [_btnPlateView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                         
                         [_netidField setAlpha:1];
                         [_passwordField setAlpha:1];
                         [_forgotButton setAlpha:1];
                         [_loginButton setAlpha:1];
                         
                         [_sunView setFrame:CGRectMake(
                                                          _sunView.frame.origin.x - 50,
                                                          _sunView.frame.origin.y,
                                                          _sunView.frame.size.width,
                                                          _sunView.frame.size.height)];
                         [_netidField setFrame:CGRectMake(
                                                          _netidField.frame.origin.x - 50,
                                                          _netidField.frame.origin.y,
                                                          _netidField.frame.size.width,
                                                          _netidField.frame.size.height)];
                         [_passwordField setFrame:CGRectMake(
                                                             _passwordField.frame.origin.x - 50,
                                                             _passwordField.frame.origin.y,
                                                             _passwordField.frame.size.width,
                                                             _passwordField.frame.size.height)];
                         [_forgotButton setFrame:CGRectMake(
                                                            _forgotButton.frame.origin.x - 50,
                                                            _forgotButton.frame.origin.y,
                                                            _forgotButton.frame.size.width,
                                                            _forgotButton.frame.size.height)];
                         [_loginButton setFrame:CGRectMake(
                                                           _loginButton.frame.origin.x - 50,
                                                           _loginButton.frame.origin.y,
                                                           _loginButton.frame.size.width,
                                                           _loginButton.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished) {
                         [self animateArrows:0];
                         [self animateSun];
                     }];
}


#pragma mark animate arrows and sun
-(void) animateSun
{
    if (stopAnimation) return;
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _sunView.transform = CGAffineTransformRotate(_sunView.transform, M_PI /2);
                     }
                     completion:^(BOOL finished) {
                         [self animateSun];
                     }];
}

-(void) animateArrows:(int)idx
{
    if (stopAnimation) return;
    UIView *viewToAnimate;
    switch (idx) {
        case 0:
            viewToAnimate = _arrowView_1;
            break;
        case 1:
            viewToAnimate = _arrowView_2;
            break;
        case 2:
            viewToAnimate = _arrowView_3;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:0.7
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [viewToAnimate setAlpha:0];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.7
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [viewToAnimate setAlpha:1];
                                              int i  = (idx + 1) % 3;
                                              [self animateArrows:i];
                                          }
                                          completion:^(BOOL finished) {
                                          }];
                     }];
}

#pragma mark TextField Animations
-(void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    NSArray *subviews = [self.view subviews];
    for (id objects in subviews) {
        if ([objects isKindOfClass:[UITextField class]]) {
            UITextField *theTextField = objects;
            if ([objects isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
    }
}

@end
