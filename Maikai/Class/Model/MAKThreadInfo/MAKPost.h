//
//  MAKPosts.h
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAKPost : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *com;
@property (nonatomic, strong) NSString *semanticUrl;
@property (nonatomic, assign) double time;
@property (nonatomic, assign) double tim;
@property (nonatomic, assign) double replies;
@property (nonatomic, strong) NSString *sub;
@property (nonatomic, assign) double imagelimit;
@property (nonatomic, assign) double tnH;
@property (nonatomic, assign) double images;
@property (nonatomic, strong) NSString *now;
@property (nonatomic, strong) NSString *ext;
@property (nonatomic, assign) double h;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double w;
@property (nonatomic, assign) double tnW;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, assign) double fsize;
@property (nonatomic, assign) double noProperty;
@property (nonatomic, assign) double uniqueIps;
@property (nonatomic, strong) NSString *md5;
@property (nonatomic, assign) double customSpoiler;
@property (nonatomic, assign) double spoiler;
@property (nonatomic, assign) double bumplimit;
@property (nonatomic, assign) double resto;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
