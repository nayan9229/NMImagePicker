//
//  AEImageObj.h
//
//  Created by   on 08/03/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NMImageObj : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *imagePathAssert;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *eventId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
