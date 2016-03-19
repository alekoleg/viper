
NS_ASSUME_NONNULL_BEGIN

/*! Протокл выходных данных от интерактора */
@class FeedStorageModel;
@protocol FeedInteractorOutput <NSObject>

/*! Упешно загрузились данные */
- (void)didFetchedRSSItems:(NSArray<FeedStorageModel *> *)items;

/*! Данные загрузились с ошибкой */
- (void)didFailToFetchRSSItems:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
