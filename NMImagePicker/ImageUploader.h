//
//  ImageUploader.h
//  NMImagePicker
//
//  Created by nayan on 29/03/17.
//  Copyright © 2017 Vishavatech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMImageObj.h"

@interface ImageUploader : NSObject
{
@private
}

@property (nonatomic, retain) NSString *text;

+ (ImageUploader *)sharedInstance;

-(void) AddToQue:(NMImageObj *) Image EventId:(NSString *) event_id;

@end
