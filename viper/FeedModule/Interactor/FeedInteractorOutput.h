NS_ASSUME_NONNULL_BEGIN

@class FeedStorageModel;

/*! Протокл выходных данных от интерактора */
@protocol FeedInteractorOutput <NSObject>

/*! Упешно загрузились данные */
- (void)didFetchedRSSItems:(NSArray<FeedStorageModel *> *)items;

/*! Данные загрузились с ошибкой */
- (void)didFailToFetchRSSItems:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
