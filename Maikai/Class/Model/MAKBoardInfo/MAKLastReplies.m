//
//  MAKLastReplies.m
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MAKLastReplies.h"


NSString *const kMAKLastRepliesW = @"w";
NSString *const kMAKLastRepliesH = @"h";
NSString *const kMAKLastRepliesNow = @"now";
NSString *const kMAKLastRepliesSpoiler = @"spoiler";
NSString *const kMAKLastRepliesFilename = @"filename";
NSString *const kMAKLastRepliesTnH = @"tn_h";
NSString *const kMAKLastRepliesTime = @"time";
NSString *const kMAKLastRepliesTim = @"tim";
NSString *const kMAKLastRepliesTnW = @"tn_w";
NSString *const kMAKLastRepliesCom = @"com";
NSString *const kMAKLastRepliesFsize = @"fsize";
NSString *const kMAKLastRepliesExt = @"ext";
NSString *const kMAKLastRepliesNo = @"no";
NSString *const kMAKLastRepliesMd5 = @"md5";
NSString *const kMAKLastRepliesResto = @"resto";
NSString *const kMAKLastRepliesName = @"name";


@interface MAKLastReplies ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MAKLastReplies

@synthesize w = _w;
@synthesize h = _h;
@synthesize now = _now;
@synthesize spoiler = _spoiler;
@synthesize filename = _filename;
@synthesize tnH = _tnH;
@synthesize time = _time;
@synthesize tim = _tim;
@synthesize tnW = _tnW;
@synthesize com = _com;
@synthesize fsize = _fsize;
@synthesize ext = _ext;
@synthesize noProperty = _noProperty;
@synthesize md5 = _md5;
@synthesize resto = _resto;
@synthesize name = _name;


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
            self.w = [[self objectOrNilForKey:kMAKLastRepliesW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kMAKLastRepliesH fromDictionary:dict] doubleValue];
            self.now = [self objectOrNilForKey:kMAKLastRepliesNow fromDictionary:dict];
            self.spoiler = [[self objectOrNilForKey:kMAKLastRepliesSpoiler fromDictionary:dict] doubleValue];
            self.filename = [self objectOrNilForKey:kMAKLastRepliesFilename fromDictionary:dict];
            self.tnH = [[self objectOrNilForKey:kMAKLastRepliesTnH fromDictionary:dict] doubleValue];
            self.time = [[self objectOrNilForKey:kMAKLastRepliesTime fromDictionary:dict] doubleValue];
            self.tim = [[self objectOrNilForKey:kMAKLastRepliesTim fromDictionary:dict] doubleValue];
            self.tnW = [[self objectOrNilForKey:kMAKLastRepliesTnW fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kMAKLastRepliesCom fromDictionary:dict];
            self.fsize = [[self objectOrNilForKey:kMAKLastRepliesFsize fromDictionary:dict] doubleValue];
            self.ext = [self objectOrNilForKey:kMAKLastRepliesExt fromDictionary:dict];
            self.noProperty = [[self objectOrNilForKey:kMAKLastRepliesNo fromDictionary:dict] doubleValue];
            self.md5 = [self objectOrNilForKey:kMAKLastRepliesMd5 fromDictionary:dict];
            self.resto = [[self objectOrNilForKey:kMAKLastRepliesResto fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMAKLastRepliesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kMAKLastRepliesW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kMAKLastRepliesH];
    [mutableDict setValue:self.now forKey:kMAKLastRepliesNow];
    [mutableDict setValue:[NSNumber numberWithDouble:self.spoiler] forKey:kMAKLastRepliesSpoiler];
    [mutableDict setValue:self.filename forKey:kMAKLastRepliesFilename];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tnH] forKey:kMAKLastRepliesTnH];
    [mutableDict setValue:[NSNumber numberWithDouble:self.time] forKey:kMAKLastRepliesTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tim] forKey:kMAKLastRepliesTim];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tnW] forKey:kMAKLastRepliesTnW];
    [mutableDict setValue:self.com forKey:kMAKLastRepliesCom];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fsize] forKey:kMAKLastRepliesFsize];
    [mutableDict setValue:self.ext forKey:kMAKLastRepliesExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.noProperty] forKey:kMAKLastRepliesNo];
    [mutableDict setValue:self.md5 forKey:kMAKLastRepliesMd5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resto] forKey:kMAKLastRepliesResto];
    [mutableDict setValue:self.name forKey:kMAKLastRepliesName];

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

    self.w = [aDecoder decodeDoubleForKey:kMAKLastRepliesW];
    self.h = [aDecoder decodeDoubleForKey:kMAKLastRepliesH];
    self.now = [aDecoder decodeObjectForKey:kMAKLastRepliesNow];
    self.spoiler = [aDecoder decodeDoubleForKey:kMAKLastRepliesSpoiler];
    self.filename = [aDecoder decodeObjectForKey:kMAKLastRepliesFilename];
    self.tnH = [aDecoder decodeDoubleForKey:kMAKLastRepliesTnH];
    self.time = [aDecoder decodeDoubleForKey:kMAKLastRepliesTime];
    self.tim = [aDecoder decodeDoubleForKey:kMAKLastRepliesTim];
    self.tnW = [aDecoder decodeDoubleForKey:kMAKLastRepliesTnW];
    self.com = [aDecoder decodeObjectForKey:kMAKLastRepliesCom];
    self.fsize = [aDecoder decodeDoubleForKey:kMAKLastRepliesFsize];
    self.ext = [aDecoder decodeObjectForKey:kMAKLastRepliesExt];
    self.noProperty = [aDecoder decodeDoubleForKey:kMAKLastRepliesNo];
    self.md5 = [aDecoder decodeObjectForKey:kMAKLastRepliesMd5];
    self.resto = [aDecoder decodeDoubleForKey:kMAKLastRepliesResto];
    self.name = [aDecoder decodeObjectForKey:kMAKLastRepliesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_w forKey:kMAKLastRepliesW];
    [aCoder encodeDouble:_h forKey:kMAKLastRepliesH];
    [aCoder encodeObject:_now forKey:kMAKLastRepliesNow];
    [aCoder encodeDouble:_spoiler forKey:kMAKLastRepliesSpoiler];
    [aCoder encodeObject:_filename forKey:kMAKLastRepliesFilename];
    [aCoder encodeDouble:_tnH forKey:kMAKLastRepliesTnH];
    [aCoder encodeDouble:_time forKey:kMAKLastRepliesTime];
    [aCoder encodeDouble:_tim forKey:kMAKLastRepliesTim];
    [aCoder encodeDouble:_tnW forKey:kMAKLastRepliesTnW];
    [aCoder encodeObject:_com forKey:kMAKLastRepliesCom];
    [aCoder encodeDouble:_fsize forKey:kMAKLastRepliesFsize];
    [aCoder encodeObject:_ext forKey:kMAKLastRepliesExt];
    [aCoder encodeDouble:_noProperty forKey:kMAKLastRepliesNo];
    [aCoder encodeObject:_md5 forKey:kMAKLastRepliesMd5];
    [aCoder encodeDouble:_resto forKey:kMAKLastRepliesResto];
    [aCoder encodeObject:_name forKey:kMAKLastRepliesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    MAKLastReplies *copy = [[MAKLastReplies alloc] init];
    
    if (copy) {

        copy.w = self.w;
        copy.h = self.h;
        copy.now = [self.now copyWithZone:zone];
        copy.spoiler = self.spoiler;
        copy.filename = [self.filename copyWithZone:zone];
        copy.tnH = self.tnH;
        copy.time = self.time;
        copy.tim = self.tim;
        copy.tnW = self.tnW;
        copy.com = [self.com copyWithZone:zone];
        copy.fsize = self.fsize;
        copy.ext = [self.ext copyWithZone:zone];
        copy.noProperty = self.noProperty;
        copy.md5 = [self.md5 copyWithZone:zone];
        copy.resto = self.resto;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
