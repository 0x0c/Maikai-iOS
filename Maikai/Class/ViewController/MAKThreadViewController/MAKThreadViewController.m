//
//  MAKThreadViewController.m
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import "MAKThreadViewController.h"
#import "URL.h"
#import "MAKThreadInfo.h"
#import "MAKThreadPostCell.h"
#import "M2DAPIGatekeeper.h"
#import "MAKImageViewerController.h"
#import "UIImage+MultiFormat.h"
#import "UIImageView+WebCache.h"

@interface MAKThreadViewController ()

@property (nonatomic, strong) MAKThreadInfo *info;

@end

@implementation MAKThreadViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MAKThreadPostCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MAKThreadPostCell class])];
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 107;
	
	__block typeof(self) bself = self;
	NSURL *url = [[NSURL URLWithString:FourChanBaseURL] URLByAppendingPathComponent:[NSString stringWithFormat:GetThreadAPI, self.boardName, (long long)self.threadNumber]];
	M2DAPIRequest *r = [M2DAPIRequest GETRequest:url];
	[r whenSucceeded:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, id parsedObject) {
		bself.info = [MAKThreadInfo modelObjectWithDictionary:parsedObject];
		dispatch_async(dispatch_get_main_queue(), ^{
			[bself.tableView reloadData];
		});
	}];
	[r whenFailed:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, id parsedObject, NSError *error) {
		NSLog(@"%@", [error description]);
	}];
	[[M2DAPIGatekeeper sharedInstance] sendAsynchronousRequest:r];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.info.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MAKThreadPostCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MAKThreadPostCell class]) forIndexPath:indexPath];
	
	// Configure the cell...
	MAKPost *post = self.info.posts[indexPath.row];
	cell.nameLabel.text = post.name;
	[cell.nameLabel sizeToFit];
	if (cell.thumbnailImageView.gestureRecognizers.count == 0) {
		UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage:)];
		[cell.thumbnailImageView addGestureRecognizer:gesture];
	}
	cell.thumbnailImageView.userInteractionEnabled = YES;
	cell.thumbnailImageView.tag = indexPath.row;
	NSMutableAttributedString *attributedBodyString = [[NSMutableAttributedString alloc] initWithData:[post.com dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
	[attributedBodyString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} range:NSMakeRange(0, attributedBodyString.length)];

	cell.bodyLabel.attributedText = attributedBodyString;
	[cell.bodyLabel sizeToFit];
	
	if (post.tim == 0) {
		cell.imageWidthConstraint.constant = 0;
	}
	else {
		cell.imageWidthConstraint.constant = kThreadPostCellImageViewDefaultWidth;
	}
	NSURL *url = [[[NSURL URLWithString:FourChanThumbnailBaseURL] URLByAppendingPathComponent:self.boardName] URLByAppendingPathComponent:[NSString stringWithFormat:GetThumbnailURL, (long long)post.tim]];
	[cell.thumbnailImageView sd_setImageWithURL:url];
	
	return cell;
}

- (void)showImage:(id)sender
{
	__weak typeof(self) bself = self;
	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *)sender;
	MAKImageViewerController *viewController = [[MAKImageViewerController alloc] initWithRemoteImageHandler:^NSURLRequest *(NSInteger pageIndex) {
		MAKPost *post = self.info.posts[gesture.view.tag];
		NSURL *url = [[NSURL URLWithString:FourChanImageBaseURL] URLByAppendingPathComponent:[NSString stringWithFormat:GetImageAPI, bself.boardName, (long long)post.tim, post.ext]];
		return [NSURLRequest requestWithURL:url];
	} numberOfImages:1 direction:RDPagingViewForwardDirectionRight];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[self presentViewController:navigationController animated:YES completion:nil];
}

@end
