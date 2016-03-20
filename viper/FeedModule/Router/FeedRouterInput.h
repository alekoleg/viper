NS_ASSUME_NONNULL_BEGIN

/*! Протокол навигации по модулю */
@protocol FeedRouterInput <NSObject>

/*! Открывает url в Safari
 *
 *	@param url - урл, который нужно отрыть
 **/
- (void)openURL:(NSURL * _Nullable)url;

@end

NS_ASSUME_NONNULL_END