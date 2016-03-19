//
//  FeedRSSService.m
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import "FeedRSSService.h"
#import "FeedRSSService+Private.h"
#import "FeedRSSParser.h"

#import <Bolts/Bolts.h>

static NSString * const kFeedRSSLentaLink = @"http://lenta.ru/rss";
static NSString * const kFeedRSSGazentaLink = @"http://gazeta.ru/export/rss/lenta.xml";

@implementation FeedRSSService

#pragma mark - Input -

- (void)loadRSSItems
{
	__weak typeof(self) weakSelf = self;

	NSArray<BFTask *> *tasks = @[
								 [self loadRSSItemsForLink:kFeedRSSLentaLink],
								 [self loadRSSItemsForLink:kFeedRSSGazentaLink],
								 ];

	[[BFTask taskForCompletionOfAllTasksWithResults:tasks]
		continueWithBlock:^id _Nullable(BFTask * _Nonnull task)
	{
		if (task.error)
		{
			[weakSelf.output rssServiceDidFailToLoadItems:task.error];
		}
		else
		{
			[weakSelf processResponseToOutput:task.result];
		}

		return nil;
	}];
}

#pragma mark - Actions -

- (BFTask *)loadRSSItemsForLink:(NSString *)link
{
	NSCParameterAssert(link);

	BFTaskCompletionSource *source = [BFTaskCompletionSource taskCompletionSource];

	[[self createParserWithLink:link] parseRSSFeed:link success:^(NSArray<MWFeedInfo *> *items) {
		[source setResult:items];
	} failure:^(NSError *error) {
		[source setError:error];
	}];
	return source.task;
}

- (void)processResponseToOutput:(NSArray<NSArray *> *)results
{
	NSMutableArray *items = [NSMutableArray array];
	[results enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger _, BOOL * _Nonnull __) {
		[items addObjectsFromArray:obj];
	}];

	[self.output rssServiceDidLoadItems:items];
}

#pragma mark - Helpers -

- (FeedRSSParser *)createParserWithLink:(NSString *)link;
{
	return [[FeedRSSParser alloc] initWithLink:link];
}

@end
