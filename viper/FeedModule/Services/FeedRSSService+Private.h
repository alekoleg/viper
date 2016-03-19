NS_ASSUME_NONNULL_BEGIN

@class FeedRSSParser;

/*! Приватные методы для тестирования */
@interface FeedRSSService ()

- (FeedRSSParser *)createParserWithLink:(NSString *)link;

@end

NS_ASSUME_NONNULL_END
