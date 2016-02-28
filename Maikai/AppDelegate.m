//
//  AppDelegate.m
//  Maikai
//
//  Created by Akira Matsuda on 2/28/16.
//  Copyright © 2016 Akira Matsuda. All rights reserved.
//

#import "AppDelegate.h"
#import "M2DAPIGatekeeper.h"
#import "JGProgressHUD.h"
#import "JGProgressHUDFadeAnimation.h"
#import "JGProgressHUDFadeZoomAnimation.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Override point for customization after application launch.
	UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
	UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
	navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
	splitViewController.delegate = self;
	splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;

	M2DAPIGatekeeper *gatekeeper = [M2DAPIGatekeeper sharedInstance];
	[gatekeeper parseBlock:^id(NSData *data, NSError *__autoreleasing *error) {
		id result = nil;
		if (*error == nil) {
			result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
		}
		return result;
	}];
	
	[gatekeeper resultConditionBlock:^BOOL(M2DAPIRequest *request, NSURLResponse *response, id parsedObject, NSError *__autoreleasing *error) {
		return [(NSHTTPURLResponse *)response statusCode] == 200;
	}];
	
	[gatekeeper initializeBlock:^(M2DAPIRequest *request, NSDictionary *params) {
		dispatch_async(dispatch_get_main_queue(), ^{
			JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:JGProgressHUDStyleDark];
			hud.interactionType = JGProgressHUDInteractionTypeBlockAllTouches;
			hud.cornerRadius = 20;
			hud.animation = [JGProgressHUDFadeZoomAnimation animation];
			[hud showInView:[[UIApplication sharedApplication].delegate window]];
		});
	}];
	[gatekeeper finalizeBlock:^(M2DAPIRequest *request, NSDictionary *httpHeaderField, id parsedObject) {
		dispatch_async(dispatch_get_main_queue(), ^{
			for (JGProgressHUD *hud in [JGProgressHUD allProgressHUDsInView:[[UIApplication sharedApplication].delegate window]]) {
				[hud dismissAnimated:YES];
			}
		});
	}];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController
{
	return YES;
}

@end
