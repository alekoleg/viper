#import <UIKit/UIKit.h>

@class FeedViewModel;

/*! Ячейка отображения данный RSS ленты */
@interface FeedCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *pictureView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *fullTextLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *siteLabel;

/*! Обновление данных
 *
 *	@param model - новая модель с данными
 **/
- (void)updateWithViewModel:(FeedViewModel *)model;

@end
