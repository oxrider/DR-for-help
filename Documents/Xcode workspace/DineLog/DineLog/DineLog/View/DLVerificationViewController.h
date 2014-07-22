//
//  DLVerificationViewController.h
//  DineLog
//
//  Created by Tengyu Liu on 7/14/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLImportManager.h"
#import "DLExpandableTableViewController.h"

@interface DLVerificationViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *dotsView;
@property (weak, nonatomic) IBOutlet UIImageView *veriBoard1;
@property (weak, nonatomic) IBOutlet UIImageView *completionBoard;
@property (weak, nonatomic) IBOutlet UIImageView *veriBoard2;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *textResend;
@property (weak, nonatomic) IBOutlet UIButton *textCont;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *emailResend;
@property (weak, nonatomic) IBOutlet UIButton *emailCont;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *Veri1Collection;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *Veri2Collection;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allViewCollection;

@end
