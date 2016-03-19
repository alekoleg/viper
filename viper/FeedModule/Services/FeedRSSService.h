#import <Foundation/Foundation.h>
#import "FeedRSSServiceInput.h"
#import "FeedRSSServiceOutput.h"

NS_ASSUME_NONNULL_BEGIN

/*! Сервис загрузки RSS лент */
@interface FeedRSSService : NSObject<FeedRSSServiceInput>

@property (nonatomic, weak) id<FeedRSSServiceOutput> output;

@end

NS_ASSUME_NONNULL_END
