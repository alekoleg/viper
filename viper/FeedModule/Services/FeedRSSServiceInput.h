
/*! Протокол для взаимодействия c RSS сервисом */
@protocol FeedRSSServiceInput <NSObject>

/*! Загрузка RSS данных */
- (void)loadRSSItems;

@end