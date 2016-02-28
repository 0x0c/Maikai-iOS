//
//  MAKThreadPostCell.h
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

static CGFloat kThreadPostCellImageViewDefaultWidth = 106;

@interface MAKThreadPostCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *bodyLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstraint;

@end
