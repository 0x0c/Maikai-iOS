//
//  MAKThreadInfo.h
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAKPost.h"

@interface MAKThreadInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray<MAKPost *> *posts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
