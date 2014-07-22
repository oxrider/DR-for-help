//
//  DLSignUpViewController.h
//  DineLog
//
//  Created by Tengyu Liu on 7/10/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLImportManager.h"
#import "DLUser.h"

@interface DLSignUpViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate>
{
    NSArray *imageArray;
    DLUser *user;
    int DLSignUp_HeadPicPageNum;
    CGFloat DLSignUp_HeadPicPage_w_off;
}

@property (weak, nonatomic) IBOutlet UIImageView *threeDotsView;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow3;
@property (weak, nonatomic) IBOutlet UIImageView *sunView;
@property (weak, nonatomic) IBOutlet UIImageView *bigHeadPicView;
@property (weak, nonatomic) IBOutlet UITextField *netidField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allViewsCollection;

- (IBAction)scrollLeft:(id)sender;
- (IBAction)scrollRight:(id)sender;


@end
