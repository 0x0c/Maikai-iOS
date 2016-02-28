//
//  MAKCategoryViewController.m
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import "MAKCategoryViewController.h"
#import "MAKCategoryCell.h"
#import "MAKBoardViewController.h"

@interface MAKCategoryViewController ()

@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> *categories;

@end

@implementation MAKCategoryViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Category";
	
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.categories = @[
					@{@"a" : @"Anime & Manga"},
					@{@"c" : @"Anime/Cute"},
					@{@"w" : @"Anime/WAllpapers"},
					@{@"m" : @"Mecha"},
					@{@"cgl" : @"Cosplay & EGL"},
					@{@"cm" : @"Cute/Make"},
					@{@"f" : @"Flash"}
					];
	[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MAKCategoryCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MAKCategoryCell class])];
	self.tableView.rowHeight = 41;
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
	return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MAKCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MAKCategoryCell class]) forIndexPath:indexPath];
 
	// Configure the cell...
	NSDictionary *item = self.categories[indexPath.row];
	cell.indexLabel.text = item.allKeys.firstObject;
	cell.descriptionLabel.text = item[item.allKeys.firstObject];
 
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	MAKBoardViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MAKBoardViewController class])];
	NSDictionary *item = self.categories[indexPath.row];
	viewController.boardName = item.allKeys.firstObject;
	viewController.title = item[item.allKeys.firstObject];
	[self.navigationController pushViewController:viewController animated:YES];
}

@end
