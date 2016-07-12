//
//  TLNCameraViewController.m
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/11/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import "TLNCameraViewController.h"

@interface TLNCameraViewController ()
@property (strong, nonatomic) TLNShuttermailModel *model;
@end

@implementation TLNCameraViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.model = [TLNShuttermailModel sharedModel];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.model.captureSession = [[AVCaptureSession alloc] init];
    [self.model.captureSession setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error = nil;
    self.model.videoInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    if([self.model.captureSession canAddInput:self.model.videoInput])
    {
        [self.model.captureSession addInput:self.model.videoInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.model.captureSession];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = self.frameForCapture.frame;
    
    [previewLayer setFrame:frame];
    
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    self.model.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.model.stillImageOutput setOutputSettings:outputSettings];
    
    [self.model.captureSession addOutput:self.model.stillImageOutput];
    [self.model.captureSession startRunning];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.model.captureSession stopRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"cameraToDetail"])
    {
        TLNDetailViewController *detailVC = segue.destinationViewController;
        
        //[self takePicture:self];
        //detailVC.image = self.galleryView.image;
    }
}

- (void) switchViews: (id) sender
{
    [self performSegueWithIdentifier:@"cameraToDetail" sender:self];
}

- (IBAction)takePicture:(id)sender
{
    
    AVCaptureDevice* device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    if(!input) {
        // running on simulator or something else without camera
        NSLog(@"camera is not found");
    }
    else {
            // camera exists, you can alert
        AVCaptureConnection *videoConnection = nil;
        
        for(AVCaptureConnection *connection in self.model.stillImageOutput.connections)
        {
            for(AVCaptureInputPort *port in [connection inputPorts])
            {
                if([[port mediaType] isEqual:AVMediaTypeVideo])
                {
                    videoConnection = connection;
                    break;
                    }
            }
            if(videoConnection)
            {
                break;
            }
        }
    
        [self.model.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
            if(imageDataSampleBuffer != NULL)
            {
                NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                UIImage *image = [UIImage imageWithData:imageData];
                self.galleryView.image = image;
                self.model.cameraImage = image;
            }
            [self switchViews:self];
        }];
    }
    
}

#pragma mark - delegate methods

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImageWriteToSavedPhotosAlbum (image, nil, nil , nil);
    self.galleryView.image = image;
    self.galleryView.contentMode = UIViewContentModeScaleAspectFill;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
