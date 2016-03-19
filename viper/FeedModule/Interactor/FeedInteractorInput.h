
/*! Протол взаимодействия интерактором */
@protocol FeedInteractorInput <NSObject>

/*! Сообщается, что необходимо начать загрузку данных */
- (void)fetchRSSFeedItems;

@end