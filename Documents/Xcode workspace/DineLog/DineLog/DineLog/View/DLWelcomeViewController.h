//
//  DLWelcomeViewController.h
//  DineLog
//
//  Created by Tengyu Liu on 6/25/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CALayer.h>
#import "DLImportManager.h"

@interface DLWelcomeViewController : UIViewController<UITextFieldDelegate>

@property UIImageView   *welcomeLogoView;
@property UIImageView   *welcomeSunView;
@property UIImageView   *signInBoardView;
@property UIImageView   *signInSunView;

@property (weak, nonatomic) IBOutlet UIButton *signInBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet UILabel *orLabel;
@property (weak, nonatomic) IBOutlet UILabel *andLabel;

@end
