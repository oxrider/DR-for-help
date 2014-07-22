//
//  DLExpandableTableViewController.h
//  DineLog
//
//  Created by Tengyu Liu on 7/14/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLImportManager.h"
#import "DLMainBackgroundViewController.h"

@interface DLExpandableTableViewController : UITableViewController

@property NSArray *parentCells;
@property NSArray *parentCellImages;
@property NSMutableArray *childrenCells;
@property NSMutableIndexSet *expandedIndices;
@property NSMutableIndexSet *furtherExpandedIndices;
@property NSString *cellIdentifier;

@property UIImageView *headerTextImageView;
@property UIImageView *headerArrorImageView1;
@property UIImageView *headerArrorImageView2;
@property UIImageView *headerArrorImageView3;

@property NSMutableArray *pickedIndexPaths;

@property UIView *headerView;
@end
