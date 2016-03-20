#import <UIKit/UIKit.h>
#import "FeedRouterInput.h"

NS_ASSUME_NONNULL_BEGIN

@class FeedViewController;

/*! Объект навигации по модулю */
@interface FeedRouter : NSObject<FeedRouterInput>

/*! UI слой */
+ (UIViewController *)createFeedViewController;

@end

NS_ASSUME_NONNULL_END

