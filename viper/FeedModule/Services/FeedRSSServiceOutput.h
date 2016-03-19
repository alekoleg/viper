#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*! Протокол выходных данных от  RSS сервиса */
@protocol FeedRSSServiceOutput <NSObject>

/*! Данные успешно загрузились */
- (void)rssServiceDidLoadItems:(NSArray *)items;

/*! Данные не удалось загрузить */
- (void)rssServiceDidFailToLoadItems:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
