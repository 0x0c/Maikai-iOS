//
//  MAKThreadViewController.h
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAKThread.h"

@interface MAKThreadViewController : UITableViewController

@property (nonatomic, strong) NSString *boardName;
@property (nonatomic, assign) double threadNumber;

@end
