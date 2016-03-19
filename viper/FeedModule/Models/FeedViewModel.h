#import <Foundation/Foundation.h>

/*! Вью модель UI слоя */
@interface FeedViewModel : NSObject

/*! Название */
@property (nonatomic, strong) NSString *title;
/*! Более детальное описание */
@property (nonatomic, strong) NSString *longText;
/*! Ссылка на картинку */
@property (nonatomic, strong) NSURL *imageURL;
/*! Ссылка на сайт */
@property (nonatomic, strong) NSURL *siteURL;
/*! Читабельный вид сайта */
@property (nonatomic, strong) NSString *siteDisplayName;
/*! Удобно сформатированная дата */
@property (nonatomic, strong) NSString *formattedDate;

/*! Нужно ли отображать полную информацию */
@property (nonatomic, assign) BOOL showFullInfo;

@end
