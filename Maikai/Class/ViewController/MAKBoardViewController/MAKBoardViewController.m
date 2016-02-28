//
//  MAKBoardViewController.m
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import "MAKBoardViewController.h"
#import "URL.h"
#import "MAKThread.h"
#import "MAKBoardInfo.h"
#import "MAKBoardCell.h"
#import "M2DAPIGatekeeper.h"
#import "MAKThreadViewController.h"
#import "UIImage+MultiFormat.h"
#import "UIImageView+WebCache.h"

@interface MAKBoardViewController ()

@property (nonatomic, strong) NSMutableArray<MAKThread *> *threads;

@end

@implementation MAKBoardViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MAKBoardCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MAKBoardCell class])];
	self.tableView.rowHeight = 110;

	if (self.boardName.length > 0) {
		self.threads = [NSMutableArray new];
		__block typeof(self) bself = self;
		NSURL *url = [[[NSURL URLWithString:FourChanBaseURL] URLByAppendingPathComponent:self.boardName] URLByAppendingPathComponent:GetCatalogAPI];
		M2DAPIRequest *r = [M2DAPIRequest GETRequest:url];
		[r whenSucceeded:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, id parsedObject) {
			for (NSDictionary *d in parsedObject) {
				MAKBoardInfo *info = [MAKBoardInfo modelObjectWithDictionary:d];
				[bself.threads addObjectsFromArray:info.threads];
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
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
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
	return [self.threads count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MAKBoardCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MAKBoardCell class]) forIndexPath:indexPath];
	
	// Configure the cell...
	MAKThread *thread = self.threads[indexPath.row];
	cell.titleLabel.text = thread.sub;
	cell.authorLabel.text = thread.name;
	cell.descriptionLabel.text = thread.com;
	
	NSURL *url = [[[NSURL URLWithString:FourChanThumbnailBaseURL] URLByAppendingPathComponent:self.boardName] URLByAppendingPathComponent:[NSString stringWithFormat:GetThumbnailURL, (long long)thread.tim]];
	[cell.thumbnailImageView sd_setImageWithURL:url];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	MAKThreadViewController *viewController = [[MAKThreadViewController alloc] initWithStyle:UITableViewStylePlain];
	MAKThread *t = self.threads[indexPath.row];
	viewController.title = t.sub;
	viewController.boardName = self.boardName;
	viewController.threadNumber = t.no;
	[self.navigationController pushViewController:viewController animated:YES];
}

@end
