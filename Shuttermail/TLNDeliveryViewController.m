//
//  TLNDeliveryViewController.m
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLNDeliveryViewController.h"

@interface TLNDeliveryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@end

@implementation TLNDeliveryViewController

- (IBAction)sincerelyButtonTouched:(UIButton *)sender {
    SYSincerelyController *controller = [[SYSincerelyController alloc]
                                         initWithImages:[NSArray arrayWithObject:self.image]
    product:SYProductTypePostcard
    applicationKey:@"PU9TBFZCNZZDTG6CF8OL4MJTBL31CIF1WL412E9I"
    delegate:self];
    
    if (controller) {
        [self presentViewController:controller animated:YES completion:NULL];
    }
}

- (IBAction)facebookButtonTouched:(id)sender {
    
    if([self.facebookButton.titleLabel.text isEqualToString:@"Coming Soon!"])
    {
        [self displayBriefly:@"Facebook (Online)"];
    }
    else
    {
        [self displayBriefly:@"Coming Soon!"];
    }

}


- (void) displayBriefly : (NSString *) String
{
    [UIView animateWithDuration:1.0 animations:^{self.facebookButton.titleLabel.alpha = 0;} completion:^(BOOL finished) {
        [self animateBriefly: String];
    }];
    
}

- (void) animateBriefly: (NSString *) String
{
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.facebookButton.titleLabel.text = String;
                         self.facebookButton.titleLabel.alpha = 1;
                     }];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"deliveryToDetail"])
    {
        TLNDetailViewController *detailVC = segue.destinationViewController;
        detailVC.image = self.image;
    }
    
}

- (void)sincerelyControllerDidFinish:(SYSincerelyController *)controller {
    /*
     * Here I know that the user made a purchase and I can do something with it
     */
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sincerelyControllerDidCancel:(SYSincerelyController *)controller {
    /*
     * Here I know that the user hit the cancel button and they want to leave the Sincerely controller
     */
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sincerelyControllerDidFailInitiationWithError:(NSError *)error {
    /*
     * Here I know that incorrect inputs were given to initWithImages:product:applicationKey:delegate;
     */
    
    NSLog(@"Error: %@", error);
}

@end