//
//  TLNDeliveryChoiceViewController.h
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TLNShuttermailModel.h"
#import "TLNDetailViewController.h"
#import <ShipLib/ShipLib.h>



@interface TLNDeliveryViewController : UIViewController <SYSincerelyControllerDelegate>
@property (weak, nonatomic) UIImage *image;
@end