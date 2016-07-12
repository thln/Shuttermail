//
//  TLNCameraViewController.h
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/11/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TLNShuttermailModel.h"
#import "TLNDetailViewController.h"

@interface TLNCameraViewController : UIViewController <UIImagePickerControllerDelegate,
UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UIView *frameForCapture;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UIImageView *galleryView;





- (IBAction)takePicture:(id)sender;

@end

