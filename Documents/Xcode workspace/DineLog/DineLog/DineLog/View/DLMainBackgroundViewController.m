//
//  DLMainBackgroundViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/20/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLMainBackgroundViewController.h"
#import "DLMainViewController.h"

@interface DLMainBackgroundViewController ()

@end

@implementation DLMainBackgroundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUpBackground];
        // Add _blurryNavController as second nav controller
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_backgroundView setAlpha:1];
    } completion:^(BOOL finished) {
        [self moveBackground];
    }];

    DLMainViewController *mainVC = [[DLMainViewController alloc] initWithNibName:@"DLMainViewController" bundle:nil];
    _blurryNavController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    if ([_blurryNavController respondsToSelector:@selector(interactivePopGestureRecognizer)])
        _blurryNavController.interactivePopGestureRecognizer.delegate = nil;

    [_blurryNavController setNavigationBarHidden:YES];
    [self.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
    [self.navigationController presentViewController:_blurryNavController animated:NO completion:^{
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark foreground

#pragma mark background
- (void)setUpBackground
{
    [self.view setBackgroundColor:DINELOG_WHITE];
    // Custom initialization
    _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ocean Blury Big.png"]];
    float width = 500.0f/335.0f * SCREEN_HEIGHT;
    [_backgroundView setFrame:CGRectMake(0, 0, width, SCREEN_HEIGHT)];
    [_backgroundView setAlpha:0];
    [self.view addSubview:_backgroundView];
}

-(void) moveBackground
{
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_backgroundView setFrame:CGRectMake(SCREEN_WIDTH - _backgroundView.frame.size.width, 0, _backgroundView.frame.size.width, SCREEN_HEIGHT)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_backgroundView setFrame:CGRectMake(0, 0, _backgroundView.frame.size.width, SCREEN_HEIGHT)];
        } completion:^(BOOL finished) {
            [self moveBackground];
        }];
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
