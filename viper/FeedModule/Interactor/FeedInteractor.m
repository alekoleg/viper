#import "FeedInteractor.h"
#import "FeedStorageModel.h"
#import "FeedRSSServiceInput.h"
#import <MWFeedItem.h>
#import "FeedInteractor+Private.h"

@implementation FeedInteractor

#pragma mark - Actions -

- (NSArray<FeedStorageModel *> *)mapRSSItemsToStorageModel:(NSArray<MWFeedItem *> *)items
{
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:items.count];
	[items enumerateObjectsUsingBlock:^(MWFeedItem * _Nonnull obj, NSUInteger _, BOOL * _Nonnull __) {
		NSString *imageLink = [obj.enclosures firstObject][@"url"];
		FeedStorageModel *model =
			[[FeedStorageModel alloc] initWithSource:obj.link
										   imageLink:imageLink
											   title:obj.title
												text:obj.summary
												date:obj.date];
		[results addObject:model];
	}];

	return results;
}

- (NSArray<FeedStorageModel *> *)sortModels:(NSArray<FeedStorageModel *> *)models
{
	NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
	return [models sortedArrayUsingDescriptors:@[ descriptor ]];
}

#pragma mark - FeedInteractorInput -

- (void)fetchRSSFeedItems
{
	[self.service loadRSSItems];
}

#pragma mark - FeedRSSServiceOutput -

- (void)rssServiceDidLoadItems:(NSArray<MWFeedItem *> *)items
{
	NSArray<FeedStorageModel *> *models = [self mapRSSItemsToStorageModel:items];
	models = [self sortModels:models];
	[self.output didFetchedRSSItems:models];
}

- (void)rssServiceDidFailToLoadItems:(NSError *)error
{
	[self.output didFailToFetchRSSItems:error];
}

@end
