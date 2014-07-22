//
//  DLMainViewController.h
//  DineLog
//
//  Created by Tengyu Liu on 7/17/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLImportManager.h"
#import "DLPickAvailableTimeViewController.h"

@interface DLMainViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *frontViewImages;
@property (weak, nonatomic) IBOutlet UIImageView *imgNewPersonView;

- (IBAction)GoToPickTime:(id)sender;
@end
