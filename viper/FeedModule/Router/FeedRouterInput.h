NS_ASSUME_NONNULL_BEGIN

/*! Протокол навигации по модулю */
@protocol FeedRouterInput <NSObject>

- (void)openURL:(NSURL * _Nullable)url;

@end

NS_ASSUME_NONNULL_END