//
//  TLNDetailViewController.m
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//
#import "TLNDetailViewController.h"
#import <Foundation/Foundation.h>


@interface TLNDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *captionTextField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UISwitch *dateToggle;
@property (weak, nonatomic) IBOutlet UISwitch *captionToggle;
@property (strong, nonatomic) TLNShuttermailModel *model;


@end

@implementation TLNDetailViewController
NSString *dateString;
NSString *captionString;
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [TLNShuttermailModel sharedModel];
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    dateString = [dateFormat stringFromDate:today];
    self.dateLabel.text = dateString;
    
    self.imageView.image = self.model.cameraImage;
    //self.imageView.image = self.image;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailToDelivery"])
    {
        TLNDetailViewController *deliveryVC = segue.destinationViewController;
        //CHANGE IT UP HERE
        //deliveryVC.image = self.imageView.image;
        
        NSLog(@"The dimensions are %n & %n", self.imageView.image.size.height, self.imageView.image.size.width);
        
        CGSize screenSize = [[UIScreen mainScreen] applicationFrame].size;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(nil, screenSize.width, screenSize.height, 8, 0/*4*(int)screenSize.width*/, colorSpaceRef, kCGImageAlphaPremultipliedLast);
        
        CGContextTranslateCTM(ctx, 0.0, screenSize.height);
        //                CGContextRotateCTM(ctx, 0.9);
        CGContextScaleCTM(ctx, 1.2, -1.2); //1.0, -1.0
        
        
        [(CALayer*)self.customView.layer renderInContext:ctx];
        
        CGImageRef cgImage = CGBitmapContextCreateImage(ctx);
        UIImage *newImage = [UIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
        CGContextRelease(ctx);
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
        
        [UIImageJPEGRepresentation(newImage, 1.0) writeToFile:filePath atomically:NO];
        
        //self.imageView.image = newImage;
        deliveryVC.image =newImage;
        
        self.imageView.image = newImage;

        
        NSLog(@"The dimensions are %d & %d", self.imageView.image.size.height, self.imageView.image.size.width);
    }

}

- (IBAction)dateToggleSwitch:(id)sender
{
    if(self.dateToggle.selected == TRUE)
    {
        self.dateLabel.text = dateString;
        self.dateToggle.selected = FALSE;
    }
    else
    {
        self.dateLabel.text = @" ";
        self.dateToggle.selected = TRUE;
    }
}
- (IBAction)captionToggleSwitch:(id)sender
{
    if([self.captionTextField.text isEqualToString:@""])
    {
        if([captionString isEqualToString:@""])
        {
            captionString = @"Wish you were here!";
        }
        self.captionTextField.text = captionString;
    }
    else
    {
        captionString = self.captionTextField.text;
        self.captionTextField.text = @"";
    }
}

- (IBAction)goForwardButton:(id)sender {
}

- (IBAction)goBackButton:(id)sender {
}

@end