//
//  HSTipsTableViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSTipsTableViewController.h"
#import "HSTipsData.h"
#import "HSTipsTableViewCell.h"

@interface HSTipsTableViewController ()

@end

@implementation HSTipsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(tipsUpdated)
     name:@"HSTipsUpdated"
     object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [[HSTipsData sharedInstance].tips removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else {
//        NSLog(@"Unhandled editing style");
//    }
//}

- (void)tipsUpdated {
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [HSTipsData sharedInstance].tips.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSTipsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HSTipsTableViewCell"];
    
    if(!cell) {
        
        [tableView registerNib:[UINib nibWithNibName:@"HSTipsTableViewCell" bundle:nil] forCellReuseIdentifier:@"HSTipsTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"HSTipsTableViewCell"];
        
    }
    
    HSTip *tipO = [HSTipsData sharedInstance].tips[indexPath.row];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"LLL dd, yyyy hh:mm a"];
    
    cell.leftUtilityButtons = [self leftButtons];
    cell.tip = tipO.tipString;
    cell.timeLabel.text = [dateFormatter stringFromDate:tipO.dateCreated];
    cell.delegate = self;
    [cell.superview bringSubviewToFront:cell];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HSTip *tip = [HSTipsData sharedInstance].tips[indexPath.row];
    NSString *sizeString = [tip.tipString stringByAppendingString:@"\n \n"];
    
    CGSize size = [sizeString sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0]
                   constrainedToSize:CGSizeMake(280, CGFLOAT_MAX)
                       lineBreakMode:UILineBreakModeWordWrap];
    
    return size.height;
}

#pragma mark cell helpers
- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1]
                                                icon:[UIImage imageNamed:@"cross.png"]];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1]
                                                icon:[UIImage imageNamed:@"check.png"]];
    
    return leftUtilityButtons;
}

// click event on left utility button
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [[HSTipsData sharedInstance].tips removeObjectAtIndex:indexPath.row];
    
    if(index == 0) {
        //cross button
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    } else if (index == 1) {
        //check button
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    
    
    
    NSLog(@"Removing row %li", (long)indexPath.row);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
