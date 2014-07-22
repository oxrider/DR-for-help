//
//  DLWelcomeViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 6/25/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLWelcomeViewController.h"
#import "DLLogInViewController.h"
#import "DLSignUpViewController.h"

@interface DLWelcomeViewController ()

@end

@implementation DLWelcomeViewController

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
    // Disable navigation bar
    [super viewDidLoad];
    
    [self setUpInitialPositions];

   // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated
{
    [self setUpInitialPositions];
    
    [self openingAnimation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark view intro
- (void)setUpInitialPositions
{
    if (!_welcomeLogoView)
        _welcomeLogoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo Dinelog w Shado.png"]];
    if (!_welcomeSunView)
        _welcomeSunView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo Sun w Shado.png"]];
    
    [_welcomeLogoView setFrame:CGRectMake(60, 131, 204, 100)];
    [_welcomeSunView setFrame:CGRectMake(50, 473, 220, 95)];
    
    if (!_signInBoardView)
        _signInBoardView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sign in Template.png"]];
    if (!_signInSunView)
        _signInSunView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sign in Sun.png"]];
    
    _signInBoardView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT);
    _signInSunView.frame = CGRectMake(-50, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    _signInBoardView.alpha = 0;
    _signInSunView.alpha = 0;
    
    if (![self.view.subviews containsObject:_welcomeLogoView])
        [self.view addSubview:_welcomeLogoView];
    if (![self.view.subviews containsObject:_welcomeSunView])
        [self.view addSubview:_welcomeSunView];
    
    [_signInBtn setAlpha:0];
    [_signUpBtn setAlpha:0];
    [_orLabel setAlpha:0];
    [_andLabel setAlpha:0];
    
    [_signUpBtn.titleLabel setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:24]];
    [_signInBtn.titleLabel setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:24]];
    [_orLabel setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:16]];
    [_andLabel setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:13]];
}

- (void)openingAnimation
{
    [UIView animateWithDuration:1
                          delay:1
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            [_welcomeLogoView setFrame:CGRectMake(60,50, 204, 100)];
                            [_welcomeLogoView setAlpha:0];
                            
                            [_welcomeSunView setFrame:CGRectMake(50, 520, 220, 95)];
                            [_welcomeSunView setAlpha:0];
                        } completion:^(BOOL finished) {
                            [_welcomeLogoView removeFromSuperview];
                            [_welcomeSunView removeFromSuperview];
                        }];
    [UIView animateWithDuration:1
                          delay:1.7
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view setBackgroundColor:DINELOG_RED];
                     }
     
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:1
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              [self.view addSubview:_signInBoardView];
                                              [self.view addSubview:_signInSunView];
                                              [_signInBoardView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                                              [_signInSunView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                                              [_signInBoardView setAlpha:1];
                                              [_signInSunView setAlpha:1];
                                          }
                                          completion:^(BOOL finished) {
                                              [UIView animateWithDuration:0.7
                                                               animations:^{
                                                                   
                                                                   [_signInBtn setAlpha:1];
                                                                   [_signUpBtn setAlpha:1];
                                                                   [_orLabel setAlpha:1];
                                                                   [_andLabel setAlpha:1];
                                                                   
                                                                   [self.view bringSubviewToFront:_signInBtn];
                                                                   [self.view bringSubviewToFront:_signUpBtn];
                                                                   [self.view bringSubviewToFront:_orLabel];
                                                                   [self.view bringSubviewToFront:_andLabel];
                                                               } completion:^(BOOL finished) {
                                                                   [_signInBtn addTarget:self action:@selector(LogIn) forControlEvents:UIControlEventTouchUpInside];
                                                                   [_signUpBtn addTarget:self action:@selector(SignUp) forControlEvents:UIControlEventTouchUpInside];
                                                               }];
                                              
                                          }];
                     }];
}


#pragma mark log in button
-(void) LogIn
{
    [self transitionAwayToFunc:^{
        DLLogInViewController *_log_in_vc = [[DLLogInViewController alloc] initWithNibName:@"DLLogInViewController" bundle:nil];
        [self.navigationController pushViewController:_log_in_vc animated:NO];
    }];
}

#pragma mark sign up button
-(void) SignUp
{
    [self transitionAwayToFunc:^{
        DLSignUpViewController *_sign_up_vc = [[DLSignUpViewController alloc] initWithNibName:@"DLSignUpViewController" bundle:nil];
        [self.navigationController pushViewController:_sign_up_vc animated:NO];
    }];
}

#pragma mark view transition
-(void) transitionAwayToFunc:(void(^)())block
{
    [UIView animateWithDuration:1 animations:^{
        [_signInSunView setAlpha:0];
        [_signInSunView setFrame:CGRectMake(-30, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_signInBoardView setAlpha:0];
        [_signInBoardView setFrame:CGRectMake(-30, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [_signInBtn setAlpha:0];
        [_signUpBtn setAlpha:0];
        [_orLabel setAlpha:0];
        [_andLabel setAlpha:0];
        
        [_signInBtn setFrame:CGRectMake(
                                        _signInBtn.frame.origin.x-30,
                                        _signInBtn.frame.origin.y,
                                        _signInBtn.frame.size.width,
                                        _signInBtn.frame.size.height)];
        [_signUpBtn setFrame:CGRectMake(
                                        _signUpBtn.frame.origin.x-30,
                                        _signUpBtn.frame.origin.y,
                                        _signUpBtn.frame.size.width,
                                        _signUpBtn.frame.size.height)];
        [_orLabel setFrame:CGRectMake(
                                        _orLabel.frame.origin.x-30,
                                        _orLabel.frame.origin.y,
                                        _orLabel.frame.size.width,
                                        _orLabel.frame.size.height)];
        [_andLabel setFrame:CGRectMake(
                                        _andLabel.frame.origin.x-30,
                                        _andLabel.frame.origin.y,
                                        _andLabel.frame.size.width,
                                        _andLabel.frame.size.height)];
        
    } completion:^(BOOL finished) {
        block();
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
    [self screenMoveUpForLength:60];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self screenMoveBack];
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
