//
//  AppDelegate.m
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedRSSService.h"
#import "FeedInteractor.h"

@interface AppDelegate ()
@property (nonatomic, strong) FeedRSSService *service;
@property (nonatomic, strong) FeedInteractor *interactor;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.

	self.service = [[FeedRSSService alloc] init];
//
//	self.interactor = [[FeedInteractor alloc] init];
//	self.interactor.service = self.service;
//	self.service.output = self.interactor;
//
//	[self.interactor fetchRSSFeedItems];

	return YES;
}

@end
