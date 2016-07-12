//
//  TLNDeliveryChoiceViewController.m
//  TableView
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLNShuttermailModel.h"
#import "TLNDeliveryChoiceViewController.h"

@interface TLNDeliveryChoiceViewController ()
@property (strong, nonatomic) TLNShuttermailModel *model;
@end

@implementation TLNDeliveryChoiceViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
     TLNInputViewController *inputVC = segue.destinationViewController;
     inputVC.completionHandler = ^(NSString *text) {
     if (text != nil)
     {
     //Insert new table row here
     //add to model
     NSUInteger answerIndex = [self.model numberOfAnswers];
     [self.model insertAnswer:text atIndex:answerIndex];
     
     //add actual row
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:answerIndex inSection:0];
     [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     
     }
     [self dismissViewControllerAnimated:YES completion:nil];
     };
     */
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [TLNShuttermailModel sharedModel];
    
    /*
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(switchViews:)];
     
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
     self.navigationItem.rightBarButtonItem = addButton;
     */
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DeliveryChoiceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Configure the cell...
    //if statement?
    cell.textLabel.text = [self.model deliveryChoicesAtIndex:indexPath.row];
    return cell;
}


@end