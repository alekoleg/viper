#import "FeedRouter.h"
#import "FeedViewController.h"
#import "FeedAseembly.h"

static NSString * const kFeedViewControllerStoryboardID = @"FeedViewControllerID";

@implementation FeedRouter

+ (UIViewController *)createFeedViewController
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	FeedViewController *vc = [storyboard instantiateViewControllerWithIdentifier:kFeedViewControllerStoryboardID];
	[FeedAseembly asseblyFeedModule:vc];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
	return nav;
}


#pragma mark - FeedRouterInput -

- (void)openURL:(NSURL *)url
{
	if ([[UIApplication sharedApplication] canOpenURL:url])
	{
		[[UIApplication sharedApplication] openURL:url];
	}
}

@end
