//
//  MAKImageViewerControllerViewController.m
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import "MAKImageViewerController.h"

@interface MAKImageViewerController ()

@property (nonatomic, strong) NSCache *imageCache;

@end

@implementation MAKImageViewerController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.imageCache = [NSCache new];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveImage:)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
	__block typeof(self) bself = self;
	[self setImageViewConfigurationHandler:^(NSInteger index, RDImageScrollView *imageView) {
		[bself.imageCache setObject:imageView.image forKey:@"cache"];
	}];
}

- (void)dismiss
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(id)sender
{
	UIImageWriteToSavedPhotosAlbum([self.imageCache objectForKey:@"cache"], self, @selector(didFinishToSaveImage:error:contextInfo:), NULL);
}

- (void)didFinishToSaveImage:(UIImage *)image error:(NSError *)error contextInfo:(void *)contextInfo
{
	NSString *title = nil;
	NSString *message = nil;
	if (error == nil) {
		title = @"Saved";
		message = @"Image saved.";
	}
	else {
		title = @"Error";
		message = error.localizedDescription;
	}
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
	[self presentViewController:alert animated:YES completion:nil];
}

@end
