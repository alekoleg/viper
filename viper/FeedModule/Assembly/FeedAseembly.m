#import "FeedAseembly.h"
#import "FeedInteractor.h"
#import "FeedRouter.h"
#import "FeedPresenter.h"
#import "FeedViewController.h"
#import "FeedRSSService.h"

@implementation FeedAseembly

+ (void)asseblyFeedModule:(FeedViewController *)vc
{
	FeedRSSService *service = [[FeedRSSService alloc] init];
	FeedInteractor *interactor = [[FeedInteractor alloc] init];
	FeedPresenter *presenter = [[FeedPresenter alloc] init];
	FeedRouter *router = [[FeedRouter alloc] init];

	interactor.service = service;
	interactor.output = presenter;
	service.output = interactor;
	presenter.interactor = interactor;
	presenter.router = router;
	presenter.view = vc;
	vc.output = presenter;
}

@end
