//
//  MAKBoardInfo.h
//
//  Created by Akira Matsuda on 2/28/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAKThread.h"

@interface MAKBoardInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray<MAKThread *> *threads;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
