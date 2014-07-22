//
//  DLSignUpViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/10/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLSignUpViewController.h"
#import "DLVerificationViewController.h"

@interface DLSignUpViewController ()

@end

@implementation DLSignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        imageArray = [NSArray arrayWithObjects:
                      @"Head 01.png",
                      @"Head 02.png",
                      @"Head 03.png",
                      @"Head 04.png",
                      @"Head 01.png",
                      @"Head 02.png",
                      @"Head 03.png",
                      @"Head 04.png",
                      @"Head 01.png",
                      @"Head 02.png",
                      @"Head 03.png",
                      @"Head 04.png",
                      @"Head 01.png",
                      @"Head 02.png",
                      @"Head 03.png",
                      nil];

        user = [DLUser currentUser];
        
        [_netidField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [_nameField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [_passwordField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        [_phoneField setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        
        [[_continueBtn titleLabel] setFont:[UIFont fontWithName:@"MYRIADPRO-REGULAR" size:17]];
        
        [_netidField setTintColor:DINELOG_RED];
        [_nameField setTintColor:DINELOG_RED];
        [_passwordField setTintColor:DINELOG_RED];
        [_phoneField setTintColor:DINELOG_RED];
        
        DLSignUp_HeadPicPageNum = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_collectionView registerClass:[UICollectionViewCell class]
        forCellWithReuseIdentifier:SIGNUP_PIC_CELL_IDENTIFIER];
    [_continueBtn addTarget:self action:@selector(onContinue) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    for (UIView *view in _allViewsCollection) {
        [view setFrame:CGRectMake(
                                  view.frame.origin.x + 30,
                                  view.frame.origin.y,
                                  view.frame.size.width,
                                  view.frame.size.height)];
    }

    [UIView animateWithDuration:1
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         for (UIView *view in _allViewsCollection) {
                             [view setFrame:CGRectMake(
                                                       view.frame.origin.x - 30,
                                                       view.frame.origin.y,
                                                       view.frame.size.width,
                                                       view.frame.size.height)];
                             [view setAlpha:1];
                         }
                     }
                     completion:^(BOOL finished) {
                         DLSignUp_HeadPicPage_w_off = [_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]].frame.origin.x;
                         
                         [self animateArrows:0];
                         [self animateSun];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Logistics
-(void) onContinue
{
    [_netidField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_nameField resignFirstResponder];
    [_phoneField resignFirstResponder];
    [self screenMoveBack];
    
    DLVerificationViewController *vc = [[DLVerificationViewController alloc] initWithNibName:@"DLVerificationViewController" bundle:nil];
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (UIView *view in _allViewsCollection) {
            if (view != _threeDotsView){
                [view setAlpha:0];
                [view setFrame:CGRectMake(view.frame.origin.x-30,
                                         view.frame.origin.y,
                                         view.frame.size.width,
                                          view.frame.size.height)];
            }
        }
    } completion:^(BOOL finished) {
        [self.navigationController pushViewController:vc animated:NO];
    }];

}

#pragma mark animate arrows and sun
-(void) animateSun
{
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
    UIView *viewToAnimate;
    switch (idx) {
        case 0:
            viewToAnimate = _arrow1;
            break;
        case 1:
            viewToAnimate = _arrow2;
            break;
        case 2:
            viewToAnimate = _arrow3;
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
    switch (textField.tag) {
        case 0:
            [_nameField becomeFirstResponder];
            break;
        case 1:
            [_passwordField becomeFirstResponder];
            break;
        case 2:
            [_phoneField becomeFirstResponder];
            break;
        case 3:
            [textField resignFirstResponder];
            [self screenMoveBack];
            [self onContinue];
        default:
            break;
    }
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

#pragma mark UITextField Formatting
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _phoneField) {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSArray *components = [newString componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
        NSString *decimalString = [components componentsJoinedByString:@""];
        
        NSUInteger length = decimalString.length;
        BOOL hasLeadingOne = length > 0 && [decimalString characterAtIndex:0] == '1';
        
        if (length == 0 || (length > 10 && !hasLeadingOne) || (length > 11)) {
            textField.text = decimalString;
            return NO;
        }
        
        NSUInteger index = 0;
        NSMutableString *formattedString = [NSMutableString string];
        
        if (hasLeadingOne) {
            [formattedString appendString:@"1 "];
            index += 1;
        }
        
        if (length - index > 3) {
            NSString *areaCode = [decimalString substringWithRange:NSMakeRange(index, 3)];
            [formattedString appendFormat:@"(%@) ",areaCode];
            index += 3;
        }
        
        if (length - index > 3) {
            NSString *prefix = [decimalString substringWithRange:NSMakeRange(index, 3)];
            [formattedString appendFormat:@"%@-",prefix];
            index += 3;
        }
        
        NSString *remainder = [decimalString substringFromIndex:index];
        [formattedString appendString:remainder];
        
        textField.text = formattedString;
        
        return NO;
    } else {
        return YES;
    }
}


#pragma mark UICollectionView Data Source / Delegate Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [imageArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SIGNUP_PIC_CELL_IDENTIFIER forIndexPath:indexPath];
    
    int size = 50;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:
                              [UIImage imageNamed:
                               [imageArray objectAtIndex:indexPath.row]]];
    [imageView setFrame:CGRectMake(0, 0, size, size)];
    [cell.contentView addSubview:imageView];
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [UIImageView animateWithDuration:0.2
                               delay:0
                             options:UIViewAnimationOptionTransitionCrossDissolve
                          animations:^{
                              _bigHeadPicView.image = [UIImage imageNamed:
                                                       [imageArray objectAtIndex:indexPath.row]];
    }
                          completion:^(BOOL finished) {
                              user.headPicName = [imageArray objectAtIndex:indexPath.row];
    }];
}


#pragma mark UICollectionView Scrolling
- (IBAction)scrollLeft:(id)sender {
    NSLog(@"Scroll Left");
    @try{
        DLSignUp_HeadPicPageNum--;
        if (DLSignUp_HeadPicPageNum < 0) DLSignUp_HeadPicPageNum = 0;
        CGFloat newX = DLSignUp_HeadPicPage_w_off * DLSignUp_HeadPicPageNum * 4;
        [_collectionView setContentOffset:CGPointMake(newX, 0) animated:YES];
    } @catch (NSException *e) {
    }
}

- (IBAction)scrollRight:(id)sender {
    NSLog(@"Scroll Right");
    @try{
        DLSignUp_HeadPicPageNum++;
        if (DLSignUp_HeadPicPageNum > (imageArray.count-1)/4) DLSignUp_HeadPicPageNum--;
        CGFloat newX = DLSignUp_HeadPicPage_w_off * DLSignUp_HeadPicPageNum * 4;
        [_collectionView setContentOffset:CGPointMake(newX, 0) animated:YES];
    } @catch (NSException *e) {
    }
}
@end
