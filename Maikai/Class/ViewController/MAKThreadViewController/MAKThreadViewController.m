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
@property (nonatomic, strong) NSMutableArray *imageURLs;
@property (nonatomic, strong) NSCache *imageCache;

@end

@implementation MAKThreadViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.imageCache = [NSCache new];
	[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MAKThreadPostCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MAKThreadPostCell class])];
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 107;
	self.imageURLs = [NSMutableArray new];
	__block typeof(self) bself = self;
	NSURL *url = [[NSURL URLWithString:FourChanBaseURL] URLByAppendingPathComponent:[NSString stringWithFormat:GetThreadAPI, self.boardName, (long long)self.threadNumber]];
	M2DAPIRequest *r = [M2DAPIRequest GETRequest:url];
	[r whenSucceeded:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, id parsedObject) {
		bself.info = [MAKThreadInfo modelObjectWithDictionary:parsedObject];
		for (MAKPost *p in bself.info.posts) {
			if (p.tim > 0) {
				NSURL *url = [[NSURL URLWithString:FourChanImageBaseURL] URLByAppendingPathComponent:[NSString stringWithFormat:GetImageAPI, bself.boardName, (long long)p.tim, p.ext]];
				[bself.imageURLs addObject:url];
			}
		}
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
	[self.imageCache removeAllObjects];
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
	cell.thumbnailImageView.tag = 0;
	
	// Configure the cell...
	MAKPost *post = self.info.posts[indexPath.row];
	cell.nameLabel.text = post.name;
	[cell.nameLabel sizeToFit];
	if (cell.thumbnailImageView.gestureRecognizers.count == 0) {
		UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImage:)];
		[cell.thumbnailImageView addGestureRecognizer:gesture];
	}
	cell.thumbnailImageView.userInteractionEnabled = YES;
	NSMutableAttributedString *attributedBodyString = [[NSMutableAttributedString alloc] initWithData:[post.com dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
	[attributedBodyString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} range:NSMakeRange(0, attributedBodyString.length)];

	cell.bodyLabel.attributedText = attributedBodyString;
	[cell.bodyLabel sizeToFit];
	
	if (post.tim == 0) {
		cell.imageWidthConstraint.constant = 0;
	}
	else {
		cell.imageWidthConstraint.constant = kThreadPostCellImageViewDefaultWidth;
		cell.thumbnailImageView.tag = [self.imageURLs indexOfObject:[[NSURL URLWithString:FourChanImageBaseURL] URLByAppendingPathComponent:[NSString stringWithFormat:GetImageAPI, self.boardName, (long long)post.tim, post.ext]]];
	}
	NSURL *url = [[[NSURL URLWithString:FourChanThumbnailBaseURL] URLByAppendingPathComponent:self.boardName] URLByAppendingPathComponent:[NSString stringWithFormat:GetThumbnailURL, (long long)post.tim]];
	[cell.thumbnailImageView sd_setImageWithURL:url];
	
	return cell;
}

- (void)showImage:(id)sender
{
	MAKImageViewerController *viewController = [[MAKImageViewerController alloc] initWithRemoteImageHandler:^NSURLRequest *(NSInteger pageIndex) {
		NSURL *url = self.imageURLs[pageIndex];
		return [NSURLRequest requestWithURL:url];
	} numberOfImages:self.imageURLs.count direction:RDPagingViewForwardDirectionRight];
	viewController.title = self.title;
	viewController.imageCache = self.imageCache;
	UITapGestureRecognizer *gesture = (UITapGestureRecognizer *)sender;
	viewController.currentPageIndex = gesture.view.tag;
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[self presentViewController:navigationController animated:YES completion:nil];
}

@end
