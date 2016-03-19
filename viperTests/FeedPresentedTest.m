#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "FeedPresenter.h"
#import "FeedViewInput.h"
#import "FeedViewOutput.h"
#import "FeedInteractorInput.h"
#import "FeedInteractorOutput.h"
#import "FeedRouterInput.h"
#import "FeedViewModel.h"

SPEC_BEGIN(FeedPresentedTest3)

describe(@"FeedPresentedTest", ^{

	__block FeedPresenter *presenter = nil;

	beforeEach(^{
		presenter = [[FeedPresenter alloc] init];
	});

	it(@"Should start loading items when view did loaded", ^{

		id<FeedViewInput> view = [KWMock mockForProtocol:@protocol(FeedViewInput)];
		presenter.view = view;
		presenter.interactor = [KWMock mockForProtocol:@protocol(FeedInteractorInput)];

		[[(id)presenter.view should] receive:@selector(showLoadingIndicator)];
		[[(id)presenter.interactor should] receive:@selector(fetchRSSFeedItems)];

		[presenter viewDidLoaded];
	});

	it(@"Shoud start loading items when view requeres reload", ^{

		presenter.interactor = [KWMock mockForProtocol:@protocol(FeedInteractorInput)];
		[[(id)presenter.interactor should] receive:@selector(fetchRSSFeedItems)];

		[presenter reloadData];
	});

	it(@"Shoud open site for picked model", ^{

		FeedViewModel *model = [FeedViewModel nullMock];
		[model stub:@selector(openURL:) andReturn:[NSURL URLWithString:@"http://google.com"]];
		presenter.router = [KWMock mockForProtocol:@protocol(FeedRouterInput)];
		[[(id)presenter.router should] receive:@selector(openURL:)];

		[presenter didPickedViewModel:model];
	});

	it(@"On fetching fail notify UI layer", ^{

		id<FeedViewInput> view = [KWMock mockForProtocol:@protocol(FeedViewInput)];
		presenter.view = view;
		[[(id)presenter.view should] receive:@selector(showErrorMessage:)];

		NSError *error = [NSError errorWithDomain:@"TEST" code:0 userInfo:@{ NSLocalizedDescriptionKey : @"TEST KEY"}];
		[presenter didFailToFetchRSSItems:error];
	});

	it(@"On fetching success notify UI layer with items", ^{

		id<FeedViewInput> view = [KWMock mockForProtocol:@protocol(FeedViewInput)];
		presenter.view = view;
		[[(id)presenter.view should] receive:@selector(showRSSItems:)];

		NSArray *items = [NSArray nullMock];
		[presenter didFetchedRSSItems:items];
	});
});

SPEC_END
