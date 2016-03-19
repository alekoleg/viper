//
//  AppDelegate.m
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedRouter.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.

	self.window.rootViewController = [FeedRouter createFeedViewController];

	return YES;
}

@end
