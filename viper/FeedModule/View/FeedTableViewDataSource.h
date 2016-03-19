#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*! Хелпер для работы с таблице в UI слоей */
@interface FeedTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong, nullable) NSArray *content;

@end

NS_ASSUME_NONNULL_END
