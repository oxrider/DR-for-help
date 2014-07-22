//
//  DLLogInViewController.h
//  DineLog
//
//  Created by Tengyu Liu on 7/8/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLImportManager.h"
#import "DLMainBackgroundViewController.h"

@interface DLLogInViewController : UIViewController <UITextFieldDelegate>
{
    bool stopAnimation;
}

@property (weak, nonatomic) IBOutlet UIImageView *arrowView_1;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView_2;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView_3;
@property (weak, nonatomic) IBOutlet UIImageView *sunView;
@property (weak, nonatomic) IBOutlet UIImageView *inputPlateView;
@property (weak, nonatomic) IBOutlet UIImageView *btnPlateView;

@property (weak, nonatomic) IBOutlet UITextField *netidField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *forgotButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end
