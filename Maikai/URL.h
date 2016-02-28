//
//  URL.h
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef URL_h
#define URL_h

static NSString *FourChanBaseURL = @"http://a.4cdn.org";
static NSString *FourChanThumbnailBaseURL = @"http://t.4cdn.org";
static NSString *GetCatalogAPI = @"catalog.json";
static NSString *GetThumbnailURL = @"%llds.jpg";
static NSString *GetThreadAPI = @"%@/thread/%lld.json";
static NSString *FourChanImageBaseURL = @"http://i.4cdn.org";
static NSString *GetImageAPI = @"%@/%lld%@";

#endif /* URL_h */
