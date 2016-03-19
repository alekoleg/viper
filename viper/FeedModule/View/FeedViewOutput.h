@class FeedViewModel;

/*! Протокол выходных данных для UI слоя */
@protocol FeedViewOutput <NSObject>

/*! UI слой загрузился */
- (void)viewDidLoaded;

/*! Необходимо обновить данные */
- (void)reloadData;

/*! Была кликнула ячейка
 *
 *	@param model - модель данный для кликнутой ячейки
 **/
- (void)didPickedViewModel:(FeedViewModel *)model;

@end