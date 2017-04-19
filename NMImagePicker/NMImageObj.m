//
//  AEImageObj.m
//
//  Created by   on 08/03/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "NMImageObj.h"


NSString *const kNMImageObjEmail = @"email";
NSString *const kNMImageObjMessage = @"message";
NSString *const kNMImageObjImagePathAssert = @"image_path_assert";
NSString *const kNMImageObjImage = @"image";
NSString *const kNMImageObjEventId = @"event_id";


@interface NMImageObj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NMImageObj

@synthesize email = _email;
@synthesize message = _message;
@synthesize imagePathAssert = _imagePathAssert;
@synthesize image = _image;
@synthesize eventId = _eventId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.email = [self objectOrNilForKey:kNMImageObjEmail fromDictionary:dict];
            self.message = [self objectOrNilForKey:kNMImageObjMessage fromDictionary:dict];
            self.imagePathAssert = [self objectOrNilForKey:kNMImageObjImagePathAssert fromDictionary:dict];
            self.image = [self objectOrNilForKey:kNMImageObjImage fromDictionary:dict];
            self.eventId = [self objectOrNilForKey:kNMImageObjEventId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.email forKey:kNMImageObjEmail];
    [mutableDict setValue:self.message forKey:kNMImageObjMessage];
    [mutableDict setValue:self.imagePathAssert forKey:kNMImageObjImagePathAssert];
    [mutableDict setValue:self.image forKey:kNMImageObjImage];
    [mutableDict setValue:self.eventId forKey:kNMImageObjEventId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.email = [aDecoder decodeObjectForKey:kNMImageObjEmail];
    self.message = [aDecoder decodeObjectForKey:kNMImageObjMessage];
    self.imagePathAssert = [aDecoder decodeObjectForKey:kNMImageObjImagePathAssert];
    self.image = [aDecoder decodeObjectForKey:kNMImageObjImage];
    self.eventId = [aDecoder decodeObjectForKey:kNMImageObjEventId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_email forKey:kNMImageObjEmail];
    [aCoder encodeObject:_message forKey:kNMImageObjMessage];
    [aCoder encodeObject:_imagePathAssert forKey:kNMImageObjImagePathAssert];
    [aCoder encodeObject:_image forKey:kNMImageObjImage];
    [aCoder encodeObject:_eventId forKey:kNMImageObjEventId];
}

- (id)copyWithZone:(NSZone *)zone
{
    NMImageObj *copy = [[NMImageObj alloc] init];
    
    if (copy) {

        copy.email = [self.email copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.imagePathAssert = [self.imagePathAssert copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.eventId = [self.eventId copyWithZone:zone];
    }
    
    return copy;
}


@end
