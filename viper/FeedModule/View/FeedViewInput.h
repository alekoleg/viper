NS_ASSUME_NONNULL_BEGIN

/*! Протокол входных данных для UI слоя */
@protocol FeedViewInput <NSObject>

/*! Отобразить состояния загрузки */
- (void)showLoadingIndicator;

/*! Отобразить RSS данные */
- (void)showRSSItems:(NSArray *)items;

/*! Отобразить сообщение об ошибке */
- (void)showErrorMessgae:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
