//
//  TLNFortunesModel.h
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TLNShuttermailModel : NSObject

//public properties
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) AVCaptureSession *captureSession;
@property (strong, nonatomic) AVCaptureDeviceInput *videoInput;
@property (strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput;

@property (strong, nonatomic) UIImage *cameraImage;

//public methods
+ (instancetype) sharedModel;
- (NSString *) deliveryChoicesAtIndex: (NSUInteger) index;
/*
- (NSString *) randomAnswer;
- (NSUInteger) numberOfAnswers;
- (NSString *) answerAtIndex: (NSUInteger) index;
- (void) removeAnswerAtIndex: (NSUInteger) index;
- (void) insertAnswer: (NSString *) answer atIndex: (NSUInteger) index;
- (void) save;
- (void) setSecretAnswer:(NSString *) newSecretAnswer;
 */


@end