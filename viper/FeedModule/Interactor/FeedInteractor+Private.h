#import <Foundation/Foundation.h>

@class FeedStorageModel, MWFeedItem;

/*! Приватные методы для тестирования */
@interface FeedInteractor ()

/*! Преобразование моделей RSS ленты в модели для дальнейшей работы
 *	
 *	@param items - модели RSS ленты
 *	@return - преобразованые модели
 **/
- (NSArray<FeedStorageModel *> *)mapRSSItemsToStorageModel:(NSArray<MWFeedItem *> *)items;

/*! Сортировка моделей по необходимым параметрам (дате) */
- (NSArray<FeedStorageModel *> *)sortModels:(NSArray<FeedStorageModel *> *)models;

@end
