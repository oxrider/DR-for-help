//
//  DLExpandableTableViewController.m
//  DineLog
//
//  Created by Tengyu Liu on 7/14/14.
//  Copyright (c) 2014 Dinner Roulette LLC. All rights reserved.
//

#import "DLExpandableTableViewController.h"

@interface SizableImageCell : UITableViewCell {}
@property float desiredWidth;
@end
@implementation SizableImageCell
@synthesize desiredWidth;
- (void)layoutSubviews {
    [super layoutSubviews];
    
    float w=self.imageView.frame.size.width;
    if (w>desiredWidth) {
        float widthSub = w - desiredWidth;
        self.imageView.frame = CGRectMake(
                                          self.imageView.frame.origin.x + self.indentationLevel * self.indentationWidth,
                                          self.imageView.frame.origin.y,
                                          desiredWidth,
                                          self.imageView.frame.size.height);
        self.textLabel.frame = CGRectMake(
                                          self.textLabel.frame.origin.x-widthSub,
                                          self.textLabel.frame.origin.y,
                                          self.textLabel.frame.size.width+widthSub,
                                          self.textLabel.frame.size.height);
        self.detailTextLabel.frame = CGRectMake(
                                                self.detailTextLabel.frame.origin.x-widthSub,
                                                self.detailTextLabel.frame.origin.y,
                                                self.detailTextLabel.frame.size.width+widthSub,
                                                self.detailTextLabel.frame.size.height);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
}
@end

@interface DLExpandableTableViewController ()

@end

@implementation DLExpandableTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _cellIdentifier = @"DLExpandableCell";
        
        _childrenCells = [NSMutableArray arrayWithCapacity:_parentCells.count];
        
        // Custom initialization
        
        // Content initialization
        _parentCells = [NSArray arrayWithObjects:
                        @"Object 1",
                        @"Object 2",
                        @"Object 3",
                        @"Object 4",
                        @"Object 5",
                        @"Object 6",
                        @"Object 7",
                        @"Object 8",
                        nil];
        _parentCellImages = [NSArray arrayWithObjects:
                             @"ICON 1",
                             @"ICON 2",
                             @"ICON 3",
                             @"ICON 4",
                             @"ICON 5",
                             @"ICON 6",
                             @"ICON 7",
                             @"ICON 8",
                             nil];
        
        for (int i = 0; i < _parentCells.count; i++) {
            _childrenCells[i] = [NSArray arrayWithObjects:
                                 @"Sub Object 1",
                                 @"Sub Object 2",
                                 @"Sub Object 3",
                                 @"Sub Object 1",
                                 @"Sub Object 2",
                                 @"Sub Object 3",
                                 @"Sub Object 1",
                                 @"Sub Object 2",
                                 @"Sub Object 3",
                                 nil];
        }
        _childrenCells[3] = [NSArray array];
        
        _pickedIndexPaths = [[NSMutableArray alloc] init];
        
        // Initialize control for expansion
        _expandedIndices = [[NSMutableIndexSet alloc] init];
        _furtherExpandedIndices = [[NSMutableIndexSet alloc] init];
        
        
        // Register cell reuse identifier
        [self.tableView registerClass:[SizableImageCell class] forCellReuseIdentifier:_cellIdentifier];
        
        // Set up UITableView.tableHeaderView
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_headerView setBackgroundColor:DINELOG_WHITE];
        
        _headerTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TEXT.png"]];
        [_headerTextImageView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _headerArrorImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Arrow Up.png"]];
        [_headerArrorImageView1 setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _headerArrorImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Arrow Up.png"]];
        [_headerArrorImageView2 setFrame:CGRectMake(0, 5, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _headerArrorImageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Arrow Up.png"]];
        [_headerArrorImageView3 setFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [_headerView addSubview:_headerTextImageView];
        [_headerView addSubview:_headerArrorImageView1];
        [_headerView addSubview:_headerArrorImageView2];
        [_headerView addSubview:_headerArrorImageView3];
        
        [self.tableView setTableHeaderView:_headerView];
        
        [self.view setBackgroundColor:DINELOG_WHITE];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) nextView
{
    DLMainBackgroundViewController *vc = [[DLMainBackgroundViewController alloc] initWithNibName:@"DLMainBackgroundViewController" bundle:nil];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.tableView setFrame:CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    } completion:^(BOOL finished) {
        [self.navigationController pushViewController:vc animated:NO];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return _parentCells.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (![_expandedIndices containsIndex:section])
        return 1;
    if (_childrenCells[section]){
        NSArray *arr = _childrenCells[section];
        if (arr.count < 6 || [_furtherExpandedIndices containsIndex:section])
            return 1 + arr.count;
        return 6;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SizableImageCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    if (!cell)
        cell = [[SizableImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellIdentifier];
    // Configure the cell...
    
    if (indexPath.section == _parentCells.count) {
        cell.textLabel.text = @"Finish";
        [cell.textLabel setFont:FONT_MYRIAD(24)];
        if (indexPath.section %2) {
            cell.backgroundColor = DINELOG_WHITE;
            cell.textLabel.textColor = DINELOG_GRAY;
        } else {
            cell.backgroundColor = DINELOG_GRAY;
            cell.textLabel.textColor = DINELOG_WHITE;
        }
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        return cell;
    }
    
    cell.indentationWidth = 40.0f;
    
    NSString *imageName;
    NSString *accessoryName;
    
    if (indexPath.row == 0) {
        // If cell is parent node
        cell.indentationLevel = 0;
        cell.desiredWidth = 50;
        
        // Alternating color
        if (indexPath.section % 2)
        {
            cell.backgroundColor = DINELOG_WHITE;
            cell.textLabel.textColor = DINELOG_GRAY;
            imageName = [NSString stringWithFormat:@"%@.png",_parentCellImages[indexPath.section]];
            accessoryName = @"box grey";
        }
        else
        {
            cell.backgroundColor = DINELOG_GRAY;
            cell.textLabel.textColor = DINELOG_WHITE;
            imageName = [NSString stringWithFormat:@"%@ w.png",_parentCellImages[indexPath.section]];
            accessoryName = @"box white";
        }
        
        [cell.textLabel setFont:FONT_MYRIAD(24)];
        [cell.textLabel setText:_parentCells[indexPath.section]];
        
        [cell.imageView setImage:[UIImage imageNamed:imageName]];
    } else {
        // If cell is child node
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        cell.desiredWidth = 15;
        cell.indentationLevel = 1;
        
        cell.backgroundColor = DINELOG_RED;
        cell.textLabel.textColor = DINELOG_WHITE;
        [cell.textLabel setFont:FONT_MYRIAD(17)];
        [cell.textLabel setText:_childrenCells[indexPath.section][indexPath.row - 1]];
        imageName = @"sun.png";
        accessoryName = @"box white";
        
        [cell.imageView setImage:[UIImage imageNamed:imageName]];
    }
    
    // Pick correct box (filled/empty)
    if ([_pickedIndexPaths containsObject:indexPath])
        accessoryName = [NSString stringWithFormat:@"%@ filled.png", accessoryName];
    else
        accessoryName = [NSString stringWithFormat:@"%@.png", accessoryName];
    
    if (indexPath.row == 5 && ![_furtherExpandedIndices containsIndex:indexPath.section]) {
        accessoryName = @"arrow sharp.png";
        cell.textLabel.text = @"More";
    }
    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:accessoryName]];
    [cell.accessoryView setFrame:CGRectMake(0, 0, 60, 60)];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == _parentCells.count){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        return [self nextView];
    }
    
    NSIndexPath *parentIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
    if (indexPath.row == 0){
        // If selecting a parent node
        if (((NSArray*)_childrenCells[indexPath.section]).count){
            // If has children
            if ([_expandedIndices containsIndex:indexPath.section]){
                // If the node is expanded, then retract
                [_expandedIndices removeIndex:indexPath.section];
                [_furtherExpandedIndices removeIndex:indexPath.section];
            } else {
                // Otherwise expand it
                [_expandedIndices addIndex:indexPath.section];
            }
        } else {
            // If the selected parent node does not have children
            if ([_pickedIndexPaths containsObject:indexPath])
                [_pickedIndexPaths removeObject:indexPath];
            else [_pickedIndexPaths addObject:indexPath];
        }
        
    } else {
        if (indexPath.row == 5 && ![_furtherExpandedIndices containsIndex:indexPath.section])
        {
            [_furtherExpandedIndices addIndex:indexPath.section];
            [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
            return;
        }
        
        // If selecting a child node
        if ([_pickedIndexPaths containsObject:indexPath])
            [_pickedIndexPaths removeObject:indexPath];
        else [_pickedIndexPaths addObject:indexPath];
        
        // Check if the parent node should be selected
        BOOL parentShouldSet = NO;
        for (int i = 1; i <= ((NSArray*)_childrenCells[indexPath.section]).count; i++) {
            if ([_pickedIndexPaths containsObject:[NSIndexPath indexPathForRow:i inSection:indexPath.section]])
                parentShouldSet = YES;
        }
        
        // Toggle parent node
        if ((!parentShouldSet) && [_pickedIndexPaths containsObject:parentIndexPath])
            [_pickedIndexPaths removeObject:parentIndexPath];
        if (parentShouldSet && (![_pickedIndexPaths containsObject:parentIndexPath]))
            [_pickedIndexPaths addObject:parentIndexPath];
    }
    
    // Reload data
    if (indexPath.row == 0)
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
    else
        [tableView reloadData];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return 72.0f;
    else return 40.0f;
}

@end
