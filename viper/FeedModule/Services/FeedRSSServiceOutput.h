//
//  FeedRSSServiceOutput.h
//  viper
//
//  Created by Алексеенко Олег on 16/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol FeedRSSServiceOutput <NSObject>

- (void)rssServiceDidLoadItems:(NSArray *)items;
- (void)rssServiceDidFailToLoadItems:(NSError *)error;

@end