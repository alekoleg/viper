#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MWFeedInfo;

typedef void(^FeedRSSParserSuccessBlock)(NSArray<MWFeedInfo *> *items);
typedef void(^FeedRSSParserFailBlock)(NSError *error);

/*! Объект который загружает данные с RSS ленты
 **/
@interface FeedRSSParser : NSObject

/*! Инициализация 
 *	
 *	@param link - ссылка на rss ленту
 **/
- (instancetype)initWithLink:(NSString *)link;
- (instancetype)init NS_UNAVAILABLE;

/*! Парсинг RSS ленты
 *	
 *	@param complete - блок в который приходят объекты ленты
 *	@param failure - блок в который приходят сообщения об ошибке
 **/
- (void)parseRSSComplete:(FeedRSSParserSuccessBlock)complete
				 failure:(FeedRSSParserFailBlock)failure;

@end

NS_ASSUME_NONNULL_END

