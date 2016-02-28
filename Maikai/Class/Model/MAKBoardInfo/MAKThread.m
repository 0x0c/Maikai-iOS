//
//  MAKThreads.m
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MAKThread.h"
#import "MAKLastReplies.h"


NSString *const kMAKThreadsCom = @"com";
NSString *const kMAKThreadsSemanticUrl = @"semantic_url";
NSString *const kMAKThreadsTime = @"time";
NSString *const kMAKThreadsTim = @"tim";
NSString *const kMAKThreadsReplies = @"replies";
NSString *const kMAKThreadsLastReplies = @"last_replies";
NSString *const kMAKThreadsSub = @"sub";
NSString *const kMAKThreadsOmittedImages = @"omitted_images";
NSString *const kMAKThreadsImagelimit = @"imagelimit";
NSString *const kMAKThreadsTnH = @"tn_h";
NSString *const kMAKThreadsImages = @"images";
NSString *const kMAKThreadsNow = @"now";
NSString *const kMAKThreadsExt = @"ext";
NSString *const kMAKThreadsH = @"h";
NSString *const kMAKThreadsName = @"name";
NSString *const kMAKThreadsW = @"w";
NSString *const kMAKThreadsTnW = @"tn_w";
NSString *const kMAKThreadsFilename = @"filename";
NSString *const kMAKThreadsFsize = @"fsize";
NSString *const kMAKThreadsNo = @"no";
NSString *const kMAKThreadsOmittedPosts = @"omitted_posts";
NSString *const kMAKThreadsMd5 = @"md5";
NSString *const kMAKThreadsCustomSpoiler = @"custom_spoiler";
NSString *const kMAKThreadsBumplimit = @"bumplimit";
NSString *const kMAKThreadsTrip = @"trip";
NSString *const kMAKThreadsResto = @"resto";


@interface MAKThread ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MAKThread

@synthesize com = _com;
@synthesize semanticUrl = _semanticUrl;
@synthesize time = _time;
@synthesize tim = _tim;
@synthesize replies = _replies;
@synthesize lastReplies = _lastReplies;
@synthesize sub = _sub;
@synthesize omittedImages = _omittedImages;
@synthesize imagelimit = _imagelimit;
@synthesize tnH = _tnH;
@synthesize images = _images;
@synthesize now = _now;
@synthesize ext = _ext;
@synthesize h = _h;
@synthesize name = _name;
@synthesize w = _w;
@synthesize tnW = _tnW;
@synthesize filename = _filename;
@synthesize fsize = _fsize;
@synthesize no = _no;
@synthesize omittedPosts = _omittedPosts;
@synthesize md5 = _md5;
@synthesize customSpoiler = _customSpoiler;
@synthesize bumplimit = _bumplimit;
@synthesize trip = _trip;
@synthesize resto = _resto;


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
            self.com = [self objectOrNilForKey:kMAKThreadsCom fromDictionary:dict];
            self.semanticUrl = [self objectOrNilForKey:kMAKThreadsSemanticUrl fromDictionary:dict];
            self.time = [[self objectOrNilForKey:kMAKThreadsTime fromDictionary:dict] doubleValue];
            self.tim = [[self objectOrNilForKey:kMAKThreadsTim fromDictionary:dict] doubleValue];
            self.replies = [[self objectOrNilForKey:kMAKThreadsReplies fromDictionary:dict] doubleValue];
    NSObject *receivedMAKLastReplies = [dict objectForKey:kMAKThreadsLastReplies];
    NSMutableArray *parsedMAKLastReplies = [NSMutableArray array];
    if ([receivedMAKLastReplies isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMAKLastReplies) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMAKLastReplies addObject:[MAKLastReplies modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMAKLastReplies isKindOfClass:[NSDictionary class]]) {
       [parsedMAKLastReplies addObject:[MAKLastReplies modelObjectWithDictionary:(NSDictionary *)receivedMAKLastReplies]];
    }

    self.lastReplies = [NSArray arrayWithArray:parsedMAKLastReplies];
            self.sub = [self objectOrNilForKey:kMAKThreadsSub fromDictionary:dict];
            self.omittedImages = [[self objectOrNilForKey:kMAKThreadsOmittedImages fromDictionary:dict] doubleValue];
            self.imagelimit = [[self objectOrNilForKey:kMAKThreadsImagelimit fromDictionary:dict] doubleValue];
            self.tnH = [[self objectOrNilForKey:kMAKThreadsTnH fromDictionary:dict] doubleValue];
            self.images = [[self objectOrNilForKey:kMAKThreadsImages fromDictionary:dict] doubleValue];
            self.now = [self objectOrNilForKey:kMAKThreadsNow fromDictionary:dict];
            self.ext = [self objectOrNilForKey:kMAKThreadsExt fromDictionary:dict];
            self.h = [[self objectOrNilForKey:kMAKThreadsH fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMAKThreadsName fromDictionary:dict];
            self.w = [[self objectOrNilForKey:kMAKThreadsW fromDictionary:dict] doubleValue];
            self.tnW = [[self objectOrNilForKey:kMAKThreadsTnW fromDictionary:dict] doubleValue];
            self.filename = [self objectOrNilForKey:kMAKThreadsFilename fromDictionary:dict];
            self.fsize = [[self objectOrNilForKey:kMAKThreadsFsize fromDictionary:dict] doubleValue];
            self.no = [[self objectOrNilForKey:kMAKThreadsNo fromDictionary:dict] doubleValue];
            self.omittedPosts = [[self objectOrNilForKey:kMAKThreadsOmittedPosts fromDictionary:dict] doubleValue];
            self.md5 = [self objectOrNilForKey:kMAKThreadsMd5 fromDictionary:dict];
            self.customSpoiler = [[self objectOrNilForKey:kMAKThreadsCustomSpoiler fromDictionary:dict] doubleValue];
            self.bumplimit = [[self objectOrNilForKey:kMAKThreadsBumplimit fromDictionary:dict] doubleValue];
            self.trip = [self objectOrNilForKey:kMAKThreadsTrip fromDictionary:dict];
            self.resto = [[self objectOrNilForKey:kMAKThreadsResto fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.com forKey:kMAKThreadsCom];
    [mutableDict setValue:self.semanticUrl forKey:kMAKThreadsSemanticUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kMAKThreadsTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tim] forKey:kMAKThreadsTim];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replies] forKey:kMAKThreadsReplies];
    NSMutableArray *tempArrayForLastReplies = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lastReplies) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLastReplies addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLastReplies addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLastReplies] forKey:kMAKThreadsLastReplies];
    [mutableDict setValue:self.sub forKey:kMAKThreadsSub];
    [mutableDict setValue:[NSNumber numberWithDouble:self.omittedImages] forKey:kMAKThreadsOmittedImages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imagelimit] forKey:kMAKThreadsImagelimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tnH] forKey:kMAKThreadsTnH];
    [mutableDict setValue:[NSNumber numberWithDouble:self.images] forKey:kMAKThreadsImages];
    [mutableDict setValue:self.now forKey:kMAKThreadsNow];
    [mutableDict setValue:self.ext forKey:kMAKThreadsExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kMAKThreadsH];
    [mutableDict setValue:self.name forKey:kMAKThreadsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kMAKThreadsW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tnW] forKey:kMAKThreadsTnW];
    [mutableDict setValue:self.filename forKey:kMAKThreadsFilename];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fsize] forKey:kMAKThreadsFsize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.no] forKey:kMAKThreadsNo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.omittedPosts] forKey:kMAKThreadsOmittedPosts];
    [mutableDict setValue:self.md5 forKey:kMAKThreadsMd5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customSpoiler] forKey:kMAKThreadsCustomSpoiler];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bumplimit] forKey:kMAKThreadsBumplimit];
    [mutableDict setValue:self.trip forKey:kMAKThreadsTrip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resto] forKey:kMAKThreadsResto];

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

    self.com = [aDecoder decodeObjectForKey:kMAKThreadsCom];
    self.semanticUrl = [aDecoder decodeObjectForKey:kMAKThreadsSemanticUrl];
    self.time = [aDecoder decodeDoubleForKey:kMAKThreadsTime];
    self.tim = [aDecoder decodeDoubleForKey:kMAKThreadsTim];
    self.replies = [aDecoder decodeDoubleForKey:kMAKThreadsReplies];
    self.lastReplies = [aDecoder decodeObjectForKey:kMAKThreadsLastReplies];
    self.sub = [aDecoder decodeObjectForKey:kMAKThreadsSub];
    self.omittedImages = [aDecoder decodeDoubleForKey:kMAKThreadsOmittedImages];
    self.imagelimit = [aDecoder decodeDoubleForKey:kMAKThreadsImagelimit];
    self.tnH = [aDecoder decodeDoubleForKey:kMAKThreadsTnH];
    self.images = [aDecoder decodeDoubleForKey:kMAKThreadsImages];
    self.now = [aDecoder decodeObjectForKey:kMAKThreadsNow];
    self.ext = [aDecoder decodeObjectForKey:kMAKThreadsExt];
    self.h = [aDecoder decodeDoubleForKey:kMAKThreadsH];
    self.name = [aDecoder decodeObjectForKey:kMAKThreadsName];
    self.w = [aDecoder decodeDoubleForKey:kMAKThreadsW];
    self.tnW = [aDecoder decodeDoubleForKey:kMAKThreadsTnW];
    self.filename = [aDecoder decodeObjectForKey:kMAKThreadsFilename];
    self.fsize = [aDecoder decodeDoubleForKey:kMAKThreadsFsize];
    self.no = [aDecoder decodeDoubleForKey:kMAKThreadsNo];
    self.omittedPosts = [aDecoder decodeDoubleForKey:kMAKThreadsOmittedPosts];
    self.md5 = [aDecoder decodeObjectForKey:kMAKThreadsMd5];
    self.customSpoiler = [aDecoder decodeDoubleForKey:kMAKThreadsCustomSpoiler];
    self.bumplimit = [aDecoder decodeDoubleForKey:kMAKThreadsBumplimit];
    self.trip = [aDecoder decodeObjectForKey:kMAKThreadsTrip];
    self.resto = [aDecoder decodeDoubleForKey:kMAKThreadsResto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_com forKey:kMAKThreadsCom];
    [aCoder encodeObject:_semanticUrl forKey:kMAKThreadsSemanticUrl];
    [aCoder encodeDouble:_time forKey:kMAKThreadsTime];
    [aCoder encodeDouble:_tim forKey:kMAKThreadsTim];
    [aCoder encodeDouble:_replies forKey:kMAKThreadsReplies];
    [aCoder encodeObject:_lastReplies forKey:kMAKThreadsLastReplies];
    [aCoder encodeObject:_sub forKey:kMAKThreadsSub];
    [aCoder encodeDouble:_omittedImages forKey:kMAKThreadsOmittedImages];
    [aCoder encodeDouble:_imagelimit forKey:kMAKThreadsImagelimit];
    [aCoder encodeDouble:_tnH forKey:kMAKThreadsTnH];
    [aCoder encodeDouble:_images forKey:kMAKThreadsImages];
    [aCoder encodeObject:_now forKey:kMAKThreadsNow];
    [aCoder encodeObject:_ext forKey:kMAKThreadsExt];
    [aCoder encodeDouble:_h forKey:kMAKThreadsH];
    [aCoder encodeObject:_name forKey:kMAKThreadsName];
    [aCoder encodeDouble:_w forKey:kMAKThreadsW];
    [aCoder encodeDouble:_tnW forKey:kMAKThreadsTnW];
    [aCoder encodeObject:_filename forKey:kMAKThreadsFilename];
    [aCoder encodeDouble:_fsize forKey:kMAKThreadsFsize];
    [aCoder encodeDouble:_no forKey:kMAKThreadsNo];
    [aCoder encodeDouble:_omittedPosts forKey:kMAKThreadsOmittedPosts];
    [aCoder encodeObject:_md5 forKey:kMAKThreadsMd5];
    [aCoder encodeDouble:_customSpoiler forKey:kMAKThreadsCustomSpoiler];
    [aCoder encodeDouble:_bumplimit forKey:kMAKThreadsBumplimit];
    [aCoder encodeObject:_trip forKey:kMAKThreadsTrip];
    [aCoder encodeDouble:_resto forKey:kMAKThreadsResto];
}

- (id)copyWithZone:(NSZone *)zone
{
    MAKThread *copy = [[MAKThread alloc] init];
    
    if (copy) {

        copy.com = [self.com copyWithZone:zone];
        copy.semanticUrl = [self.semanticUrl copyWithZone:zone];
        copy.time = self.time;
        copy.tim = self.tim;
        copy.replies = self.replies;
        copy.lastReplies = [self.lastReplies copyWithZone:zone];
        copy.sub = [self.sub copyWithZone:zone];
        copy.omittedImages = self.omittedImages;
        copy.imagelimit = self.imagelimit;
        copy.tnH = self.tnH;
        copy.images = self.images;
        copy.now = [self.now copyWithZone:zone];
        copy.ext = [self.ext copyWithZone:zone];
        copy.h = self.h;
        copy.name = [self.name copyWithZone:zone];
        copy.w = self.w;
        copy.tnW = self.tnW;
        copy.filename = [self.filename copyWithZone:zone];
        copy.fsize = self.fsize;
        copy.no = self.no;
        copy.omittedPosts = self.omittedPosts;
        copy.md5 = [self.md5 copyWithZone:zone];
        copy.customSpoiler = self.customSpoiler;
        copy.bumplimit = self.bumplimit;
        copy.trip = [self.trip copyWithZone:zone];
        copy.resto = self.resto;
    }
    
    return copy;
}


@end
