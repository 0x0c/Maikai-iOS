//
//  MAKPosts.m
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MAKPost.h"


NSString *const kMAKPostsCom = @"com";
NSString *const kMAKPostsSemanticUrl = @"semantic_url";
NSString *const kMAKPostsTime = @"time";
NSString *const kMAKPostsTim = @"tim";
NSString *const kMAKPostsReplies = @"replies";
NSString *const kMAKPostsSub = @"sub";
NSString *const kMAKPostsImagelimit = @"imagelimit";
NSString *const kMAKPostsTnH = @"tn_h";
NSString *const kMAKPostsImages = @"images";
NSString *const kMAKPostsNow = @"now";
NSString *const kMAKPostsExt = @"ext";
NSString *const kMAKPostsH = @"h";
NSString *const kMAKPostsName = @"name";
NSString *const kMAKPostsW = @"w";
NSString *const kMAKPostsTnW = @"tn_w";
NSString *const kMAKPostsFilename = @"filename";
NSString *const kMAKPostsFsize = @"fsize";
NSString *const kMAKPostsNo = @"no";
NSString *const kMAKPostsUniqueIps = @"unique_ips";
NSString *const kMAKPostsMd5 = @"md5";
NSString *const kMAKPostsCustomSpoiler = @"custom_spoiler";
NSString *const kMAKPostsSpoiler = @"spoiler";
NSString *const kMAKPostsBumplimit = @"bumplimit";
NSString *const kMAKPostsResto = @"resto";


@interface MAKPost ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MAKPost

@synthesize com = _com;
@synthesize semanticUrl = _semanticUrl;
@synthesize time = _time;
@synthesize tim = _tim;
@synthesize replies = _replies;
@synthesize sub = _sub;
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
@synthesize noProperty = _noProperty;
@synthesize uniqueIps = _uniqueIps;
@synthesize md5 = _md5;
@synthesize customSpoiler = _customSpoiler;
@synthesize spoiler = _spoiler;
@synthesize bumplimit = _bumplimit;
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
            self.com = [self objectOrNilForKey:kMAKPostsCom fromDictionary:dict];
            self.semanticUrl = [self objectOrNilForKey:kMAKPostsSemanticUrl fromDictionary:dict];
            self.time = [[self objectOrNilForKey:kMAKPostsTime fromDictionary:dict] doubleValue];
            self.tim = [[self objectOrNilForKey:kMAKPostsTim fromDictionary:dict] doubleValue];
            self.replies = [[self objectOrNilForKey:kMAKPostsReplies fromDictionary:dict] doubleValue];
            self.sub = [self objectOrNilForKey:kMAKPostsSub fromDictionary:dict];
            self.imagelimit = [[self objectOrNilForKey:kMAKPostsImagelimit fromDictionary:dict] doubleValue];
            self.tnH = [[self objectOrNilForKey:kMAKPostsTnH fromDictionary:dict] doubleValue];
            self.images = [[self objectOrNilForKey:kMAKPostsImages fromDictionary:dict] doubleValue];
            self.now = [self objectOrNilForKey:kMAKPostsNow fromDictionary:dict];
            self.ext = [self objectOrNilForKey:kMAKPostsExt fromDictionary:dict];
            self.h = [[self objectOrNilForKey:kMAKPostsH fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMAKPostsName fromDictionary:dict];
            self.w = [[self objectOrNilForKey:kMAKPostsW fromDictionary:dict] doubleValue];
            self.tnW = [[self objectOrNilForKey:kMAKPostsTnW fromDictionary:dict] doubleValue];
            self.filename = [self objectOrNilForKey:kMAKPostsFilename fromDictionary:dict];
            self.fsize = [[self objectOrNilForKey:kMAKPostsFsize fromDictionary:dict] doubleValue];
            self.noProperty = [[self objectOrNilForKey:kMAKPostsNo fromDictionary:dict] doubleValue];
            self.uniqueIps = [[self objectOrNilForKey:kMAKPostsUniqueIps fromDictionary:dict] doubleValue];
            self.md5 = [self objectOrNilForKey:kMAKPostsMd5 fromDictionary:dict];
            self.customSpoiler = [[self objectOrNilForKey:kMAKPostsCustomSpoiler fromDictionary:dict] doubleValue];
            self.spoiler = [[self objectOrNilForKey:kMAKPostsSpoiler fromDictionary:dict] doubleValue];
            self.bumplimit = [[self objectOrNilForKey:kMAKPostsBumplimit fromDictionary:dict] doubleValue];
            self.resto = [[self objectOrNilForKey:kMAKPostsResto fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.com forKey:kMAKPostsCom];
    [mutableDict setValue:self.semanticUrl forKey:kMAKPostsSemanticUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kMAKPostsTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tim] forKey:kMAKPostsTim];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replies] forKey:kMAKPostsReplies];
    [mutableDict setValue:self.sub forKey:kMAKPostsSub];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imagelimit] forKey:kMAKPostsImagelimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tnH] forKey:kMAKPostsTnH];
    [mutableDict setValue:[NSNumber numberWithDouble:self.images] forKey:kMAKPostsImages];
    [mutableDict setValue:self.now forKey:kMAKPostsNow];
    [mutableDict setValue:self.ext forKey:kMAKPostsExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kMAKPostsH];
    [mutableDict setValue:self.name forKey:kMAKPostsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kMAKPostsW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tnW] forKey:kMAKPostsTnW];
    [mutableDict setValue:self.filename forKey:kMAKPostsFilename];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fsize] forKey:kMAKPostsFsize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.noProperty] forKey:kMAKPostsNo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uniqueIps] forKey:kMAKPostsUniqueIps];
    [mutableDict setValue:self.md5 forKey:kMAKPostsMd5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customSpoiler] forKey:kMAKPostsCustomSpoiler];
    [mutableDict setValue:[NSNumber numberWithDouble:self.spoiler] forKey:kMAKPostsSpoiler];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bumplimit] forKey:kMAKPostsBumplimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resto] forKey:kMAKPostsResto];

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

    self.com = [aDecoder decodeObjectForKey:kMAKPostsCom];
    self.semanticUrl = [aDecoder decodeObjectForKey:kMAKPostsSemanticUrl];
    self.time = [aDecoder decodeDoubleForKey:kMAKPostsTime];
    self.tim = [aDecoder decodeDoubleForKey:kMAKPostsTim];
    self.replies = [aDecoder decodeDoubleForKey:kMAKPostsReplies];
    self.sub = [aDecoder decodeObjectForKey:kMAKPostsSub];
    self.imagelimit = [aDecoder decodeDoubleForKey:kMAKPostsImagelimit];
    self.tnH = [aDecoder decodeDoubleForKey:kMAKPostsTnH];
    self.images = [aDecoder decodeDoubleForKey:kMAKPostsImages];
    self.now = [aDecoder decodeObjectForKey:kMAKPostsNow];
    self.ext = [aDecoder decodeObjectForKey:kMAKPostsExt];
    self.h = [aDecoder decodeDoubleForKey:kMAKPostsH];
    self.name = [aDecoder decodeObjectForKey:kMAKPostsName];
    self.w = [aDecoder decodeDoubleForKey:kMAKPostsW];
    self.tnW = [aDecoder decodeDoubleForKey:kMAKPostsTnW];
    self.filename = [aDecoder decodeObjectForKey:kMAKPostsFilename];
    self.fsize = [aDecoder decodeDoubleForKey:kMAKPostsFsize];
    self.noProperty = [aDecoder decodeDoubleForKey:kMAKPostsNo];
    self.uniqueIps = [aDecoder decodeDoubleForKey:kMAKPostsUniqueIps];
    self.md5 = [aDecoder decodeObjectForKey:kMAKPostsMd5];
    self.customSpoiler = [aDecoder decodeDoubleForKey:kMAKPostsCustomSpoiler];
    self.spoiler = [aDecoder decodeDoubleForKey:kMAKPostsSpoiler];
    self.bumplimit = [aDecoder decodeDoubleForKey:kMAKPostsBumplimit];
    self.resto = [aDecoder decodeDoubleForKey:kMAKPostsResto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_com forKey:kMAKPostsCom];
    [aCoder encodeObject:_semanticUrl forKey:kMAKPostsSemanticUrl];
    [aCoder encodeDouble:_time forKey:kMAKPostsTime];
    [aCoder encodeDouble:_tim forKey:kMAKPostsTim];
    [aCoder encodeDouble:_replies forKey:kMAKPostsReplies];
    [aCoder encodeObject:_sub forKey:kMAKPostsSub];
    [aCoder encodeDouble:_imagelimit forKey:kMAKPostsImagelimit];
    [aCoder encodeDouble:_tnH forKey:kMAKPostsTnH];
    [aCoder encodeDouble:_images forKey:kMAKPostsImages];
    [aCoder encodeObject:_now forKey:kMAKPostsNow];
    [aCoder encodeObject:_ext forKey:kMAKPostsExt];
    [aCoder encodeDouble:_h forKey:kMAKPostsH];
    [aCoder encodeObject:_name forKey:kMAKPostsName];
    [aCoder encodeDouble:_w forKey:kMAKPostsW];
    [aCoder encodeDouble:_tnW forKey:kMAKPostsTnW];
    [aCoder encodeObject:_filename forKey:kMAKPostsFilename];
    [aCoder encodeDouble:_fsize forKey:kMAKPostsFsize];
    [aCoder encodeDouble:_noProperty forKey:kMAKPostsNo];
    [aCoder encodeDouble:_uniqueIps forKey:kMAKPostsUniqueIps];
    [aCoder encodeObject:_md5 forKey:kMAKPostsMd5];
    [aCoder encodeDouble:_customSpoiler forKey:kMAKPostsCustomSpoiler];
    [aCoder encodeDouble:_spoiler forKey:kMAKPostsSpoiler];
    [aCoder encodeDouble:_bumplimit forKey:kMAKPostsBumplimit];
    [aCoder encodeDouble:_resto forKey:kMAKPostsResto];
}

- (id)copyWithZone:(NSZone *)zone
{
    MAKPost *copy = [[MAKPost alloc] init];
    
    if (copy) {

        copy.com = [self.com copyWithZone:zone];
        copy.semanticUrl = [self.semanticUrl copyWithZone:zone];
        copy.time = self.time;
        copy.tim = self.tim;
        copy.replies = self.replies;
        copy.sub = [self.sub copyWithZone:zone];
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
        copy.noProperty = self.noProperty;
        copy.uniqueIps = self.uniqueIps;
        copy.md5 = [self.md5 copyWithZone:zone];
        copy.customSpoiler = self.customSpoiler;
        copy.spoiler = self.spoiler;
        copy.bumplimit = self.bumplimit;
        copy.resto = self.resto;
    }
    
    return copy;
}


@end
