//
//  FeedPresenter.m
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import "FeedPresenter.h"
#import "FeedViewInput.h"
#import "FeedInteractorInput.h"
#import "FeedViewModel.h"

@implementation FeedPresenter

#pragma mark - FeedInteractorOutput -

- (void)didFetchedRSSItems:(NSArray<FeedStorageModel *> *)items
{

}

- (void)didFailToFetchRSSItems:(NSError *)error
{

}

#pragma mark - FeedViewOutput -

- (void)viewDidLoaded
{
	[self.view showLoadingIndicator];
	[self startLoadingItems];
}

#pragma mark - Actions -

- (void)startLoadingItems
{
	[self.interactor fetchRSSFeedItems];
}

- (NSArray<FeedViewModel *> *)mapToViewModelStorageModel:(NSArray<FeedStorageModel *> *)items
{
	 
}




@end
