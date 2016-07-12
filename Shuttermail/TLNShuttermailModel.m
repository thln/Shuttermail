//
//  TLNShuttermailModel.m
//  Shuttermail
//
//  Created by Tam Henry Le Nguyen on 12/12/14.
//  Copyright (c) 2014 Tam Henry Le Nguyen. All rights reserved.
//

#import "TLNShuttermailModel.h"

//class extension
@interface TLNShuttermailModel ()
@property (strong, nonatomic) NSMutableArray *deliveryChoices;

@end


@implementation TLNShuttermailModel

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        if(FALSE)
        {
            //first time, create data
            _deliveryChoices = [[NSMutableArray alloc] initWithObjects:@"Sincerely (Print)", @"Facebook (Online, Beta)", nil];
        }
        else
        {
            //get data
        }
    }
    return self;

}

- (NSString *) deliveryChoiceAtIndex: (NSUInteger) index
{
    return [self.deliveryChoices objectAtIndex: index];
}

+ (instancetype) sharedModel
{
    static TLNShuttermailModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //code to be executed once - thread safe version
        _sharedModel = [[self alloc] init];
    });
    
    return _sharedModel;
}



@end