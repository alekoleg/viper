#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FeedViewController;

/*! Объект который создает все необходимые объекты для модуля */
@interface FeedAseembly : NSObject

/*! Метод в котором собирается модуль feed */
+ (void)asseblyFeedModule:(FeedViewController *)vc;

@end

NS_ASSUME_NONNULL_END
