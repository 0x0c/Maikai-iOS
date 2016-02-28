//
//  MAKBoardInfo.m
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MAKBoardInfo.h"
#import "MAKThread.h"


NSString *const kMAKBoardInfoThreads = @"threads";
NSString *const kMAKBoardInfoPage = @"page";


@interface MAKBoardInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MAKBoardInfo

@synthesize threads = _threads;
@synthesize page = _page;


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
	    NSObject *receivedMAKThreads = [dict objectForKey:kMAKBoardInfoThreads];
	    NSMutableArray *parsedMAKThreads = [NSMutableArray array];
	    if ([receivedMAKThreads isKindOfClass:[NSArray class]]) {
		    for (NSDictionary *item in (NSArray *)receivedMAKThreads) {
			    if ([item isKindOfClass:[NSDictionary class]]) {
				    [parsedMAKThreads addObject:[MAKThread modelObjectWithDictionary:item]];
			    }
		    }
	    } else if ([receivedMAKThreads isKindOfClass:[NSDictionary class]]) {
		    [parsedMAKThreads addObject:[MAKThread modelObjectWithDictionary:(NSDictionary *)receivedMAKThreads]];
	    }
		
		self.threads = [NSArray arrayWithArray:parsedMAKThreads];
		self.page = [[self objectOrNilForKey:kMAKBoardInfoPage fromDictionary:dict] doubleValue];
	}
	
	return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForThreads = [NSMutableArray array];
    for (NSObject *subArrayObject in self.threads) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForThreads addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForThreads addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForThreads] forKey:kMAKBoardInfoThreads];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kMAKBoardInfoPage];

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

    self.threads = [aDecoder decodeObjectForKey:kMAKBoardInfoThreads];
    self.page = [aDecoder decodeDoubleForKey:kMAKBoardInfoPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_threads forKey:kMAKBoardInfoThreads];
    [aCoder encodeDouble:_page forKey:kMAKBoardInfoPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    MAKBoardInfo *copy = [[MAKBoardInfo alloc] init];
    
    if (copy) {

        copy.threads = [self.threads copyWithZone:zone];
        copy.page = self.page;
    }
    
    return copy;
}


@end
