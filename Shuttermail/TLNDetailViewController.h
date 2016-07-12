//
//  TLNDetailViewController.h
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TLNShuttermailModel.h"
#import<QuartzCore/QuartzCore.h>



@interface TLNDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIView *customView;

@end