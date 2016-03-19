#import "FeedPresenter.h"
#import "FeedViewInput.h"
#import "FeedInteractorInput.h"
#import "FeedViewModel.h"
#import "FeedStorageModel.h"
#import <VZDateFormatter.h>
#import "FeedRouterInput.h"

@implementation FeedPresenter

#pragma mark - Actions -

- (void)startLoadingItems
{
	[self.interactor fetchRSSFeedItems];
}

- (NSArray<FeedViewModel *> *)mapToViewModelStorageModel:(NSArray<FeedStorageModel *> *)items
{
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:items.count];
	[items enumerateObjectsUsingBlock:^(FeedStorageModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		FeedViewModel *viewModel = [FeedViewModel new];
		viewModel.siteURL = [NSURL URLWithString:obj.source];
		viewModel.siteDisplayName = viewModel.siteURL.host;
		viewModel.title = obj.title;
		viewModel.longText = obj.text;
		viewModel.imageURL = [NSURL URLWithString:obj.imageLink];
		viewModel.formattedDate = [[VZDateFormatter defaultFormatter] stringFromDate:obj.date withFormat:@"HH:mm"];
		[results addObject:viewModel];
	}];
	return results;
}

#pragma mark - FeedInteractorOutput -

- (void)didFetchedRSSItems:(NSArray<FeedStorageModel *> *)items
{
	NSArray *viewModels = [self mapToViewModelStorageModel:items];
	[self.view showRSSItems:viewModels];
}

- (void)didFailToFetchRSSItems:(NSError *)error
{
	[self.view showErrorMessage:error.userInfo[NSLocalizedDescriptionKey]];
}

#pragma mark - FeedViewOutput -

- (void)viewDidLoaded
{
	[self.view showLoadingIndicator];
	[self startLoadingItems];
}

- (void)reloadData
{
	[self startLoadingItems];
}

- (void)didPickedViewModel:(FeedViewModel *)model
{
	[self.router openURL:model.siteURL];
}

@end
