//
//  MAKThreadInfo.m
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MAKThreadInfo.h"
#import "MAKPost.h"


NSString *const kMAKThreadInfoPosts = @"posts";


@interface MAKThreadInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MAKThreadInfo

@synthesize posts = _posts;


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
    NSObject *receivedMAKPosts = [dict objectForKey:kMAKThreadInfoPosts];
    NSMutableArray *parsedMAKPosts = [NSMutableArray array];
    if ([receivedMAKPosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMAKPosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMAKPosts addObject:[MAKPost modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMAKPosts isKindOfClass:[NSDictionary class]]) {
       [parsedMAKPosts addObject:[MAKPost modelObjectWithDictionary:(NSDictionary *)receivedMAKPosts]];
    }

    self.posts = [NSArray arrayWithArray:parsedMAKPosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForPosts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.posts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPosts] forKey:kMAKThreadInfoPosts];

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

    self.posts = [aDecoder decodeObjectForKey:kMAKThreadInfoPosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_posts forKey:kMAKThreadInfoPosts];
}

- (id)copyWithZone:(NSZone *)zone
{
    MAKThreadInfo *copy = [[MAKThreadInfo alloc] init];
    
    if (copy) {

        copy.posts = [self.posts copyWithZone:zone];
    }
    
    return copy;
}


@end
