//
//  MAKImageViewerControllerViewController.m
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import "MAKImageViewerController.h"

@interface MAKImageViewerController ()

@end

@implementation MAKImageViewerController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveImage:)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
	__block typeof(self) bself = self;
	[self setReuseIdentifierHandler:^NSString *(NSInteger pageIndex) {
		NSString *identifier = RDImageViewerControllerReuseIdentifierRemoteImage;
		if ([bself.imageCache objectForKey:[NSString stringWithFormat:@"%ld", (long)pageIndex]]) {
			identifier = RDImageViewerControllerReuseIdentifierImage;
		}
		return identifier;
	}];
	[self setImageHandler:^UIImage *(NSInteger pageIndex) {
		return [bself.imageCache objectForKey:[NSString stringWithFormat:@"%ld", (long)pageIndex]];
	}];
	[self setImageViewConfigurationHandler:^(NSInteger pageIndex, RDImageScrollView *imageView) {
		if (imageView.image) {
			[bself.imageCache setObject:imageView.image forKey:[NSString stringWithFormat:@"%ld", (long)pageIndex]];
		}
	}];
	self.showPageNumberHud = YES;
}

- (void)dismiss
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(id)sender
{
	UIImage *image = [self.imageCache objectForKey:[NSString stringWithFormat:@"%ld", (long)self.currentPageIndex]];
	if (image) {
		UIImageWriteToSavedPhotosAlbum(image, self, @selector(didFinishToSaveImage:error:contextInfo:), NULL);
	}
	else {
		NSString *title = @"Error";
		NSString *message = @"Could not load an image.";
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
		[self presentViewController:alert animated:YES completion:nil];
	}
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
