//
//  ImageUploader.m
//  NMImagePicker
//
//  Created by nayan on 29/03/17.
//  Copyright © 2017 Vishavatech. All rights reserved.
//

#import "ImageUploader.h"

#pragma mark -
#pragma mark Constants
#pragma mark -
//**********************************************************************************************************
//
//	Constants
//
//**********************************************************************************************************

#pragma mark -
#pragma mark Private Interface
#pragma mark -
//**********************************************************************************************************
//
//	Private Interface
//
//**********************************************************************************************************

#pragma mark -
#pragma mark Private Category
//**************************************************
//	Private Category
//**************************************************

@interface ImageUploader()

// Make any initialization of your class.
- (id) initSingleton;

@end

#pragma mark -
#pragma mark Public Interface
#pragma mark -
//**********************************************************************************************************
//
//	Public Interface
//
//**********************************************************************************************************

@implementation ImageUploader

#pragma mark -
#pragma mark Properties
//**************************************************
//	Properties
//**************************************************


#pragma mark -
#pragma mark Constructors
//**************************************************
//	Constructors
//**************************************************

- (id) initSingleton
{
    if ((self = [super init]))
    {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -
#pragma mark Private Methods
//**************************************************
//	Private Methods
//**************************************************

#pragma mark -
#pragma mark Self Public Methods
//**************************************************
//	Self Public Methods
//**************************************************

+ (ImageUploader *) sharedInstance
{
    // Persistent instance.
    static ImageUploader *_default = nil;
    
    // Small optimization to avoid wasting time after the
    // singleton being initialized.
    if (_default != nil)
    {
        return _default;
    }
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
    // Allocates once with Grand Central Dispatch (GCD) routine.
    // It's thread safe.
    static dispatch_once_t safer;
    dispatch_once(&safer, ^(void)
      {
          _default = [[ImageUploader alloc] initSingleton];
      });
#else
    // Allocates once using the old approach, it's slower.
    // It's thread safe.
    @synchronized([ImageUploader class])
    {
        // The synchronized instruction will make sure,
        // that only one thread will access this point at a time.
        if (_default == nil)
        {
            _default = [[ImageUploader alloc] initSingleton];
        }
    }
#endif
    return _default;
}

-(void) AddToQue:(NMImageObj *) Image EventId:(NSString *) event_id{
    NSLog(@"Event id : %@", event_id);
    NSLog(@"Message : %@", Image.message);
    NSLog(@"Image : %@", Image.image);
    NSLog(@"ImagePathAssert : %@", Image.imagePathAssert);
}

-(void)StartUploading{
    NSLog(@"this is start uploading");
}
@end

