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
	
	self.categories = @[
					@{@"a" : @"Anime & Manga"},
					@{@"c" : @"Anime/Cute"},
					@{@"w" : @"Anime/WAllpapers"},
					@{@"m" : @"Mecha"},
					@{@"cgl" : @"Cosplay & EGL"},
					@{@"cm" : @"Cute/Make"},
					@{@"f" : @"Flash"},
					@{@"n":@"Transportation"},
					@{@"jp":@"Otaku Culture"},
					@{@"v":@"Video Games"},
					@{@"vg":@"Video Game Generals"},
					@{@"vp":@"Pokémon"},
					@{@"vr":@"Retro Games"},
					@{@"co":@"Comics & Cartoons"},
					@{@"g":@"Technology"},
					@{@"tv":@"Television & Film"},
					@{@"k":@"Weapons"},
					@{@"o":@"Auto"},
					@{@"an":@"Animals & Nature"},
					@{@"tg":@"Traditional Games"},
					@{@"sp":@"Sports"},
					@{@"asp":@"Alternative Sports"},
					@{@"sci":@"Science & Math"},
					@{@"his":@"History & Humanities"},
					@{@"int":@"International"},
					@{@"out":@"Outdoors"},
					@{@"toy":@"Toys"},
					@{@"i":@"Oekaki"},
					@{@"po":@"Papercraft & Origami"},
					@{@"p":@"Photography"},
					@{@"ck":@"Food & Cooking"},
					@{@"ic":@"Artwork/Critique"},
					@{@"wg":@"Wallpapers/General"},
					@{@"mu":@"Music"},
					@{@"fa":@"Fashion"},
					@{@"3":@"3DCG"},
					@{@"gd":@"Graphic Design"},
					@{@"diy":@"Do-It-Yourself"},
					@{@"wsg":@"Worksafe GIF"},
					@{@"biz":@"Business & Finance"},
					@{@"trv":@"Travel"},
					@{@"fit":@"Fitness"},
					@{@"x":@"Paranormal"},
					@{@"lit":@"Literature"},
					@{@"adv":@"Advice"},
					@{@"lgbt":@"LGBT"},
					@{@"mlp":@"Pony"},
					@{@"news":@"Current News"},
					@{@"wsr":@"Worksafe Requests"},
					@{@"b":@"Random"},
					@{@"r9k":@"ROBOT9001"},
					@{@"pol":@"Politically Incorrect"},
					@{@"soc":@"Cams & Meetups"},
					@{@"s4s":@"Shit 4chan Says"},
					@{@"s":@"Sexy Beautiful Women"},
					@{@"hc":@"Hardcore"},
					@{@"hm":@"Handsome Men"},
					@{@"h":@"Hentai"},
					@{@"e":@"Ecchi"},
					@{@"u":@"Yuri"},
					@{@"d":@"Hentai/Alternative"},
					@{@"y":@"Yaoi"},
					@{@"t":@"Torrents"},
					@{@"hr":@"High Resolution"},
					@{@"gif":@"Adult GIF"},
					@{@"aco":@"Adult Cartoons"},
					@{@"r":@"Adult Requests"}
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
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		MAKBoardViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MAKBoardViewController class])];
		NSDictionary *item = self.categories[indexPath.row];
		viewController.boardName = item.allKeys.firstObject;
		viewController.title = item[item.allKeys.firstObject];
		UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
		[self.splitViewController showDetailViewController:navigationController sender:nil];
	}
	else {
		MAKBoardViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([MAKBoardViewController class])];
		NSDictionary *item = self.categories[indexPath.row];
		viewController.boardName = item.allKeys.firstObject;
		viewController.title = item[item.allKeys.firstObject];
		[self.navigationController pushViewController:viewController animated:YES];
	}
}

@end
