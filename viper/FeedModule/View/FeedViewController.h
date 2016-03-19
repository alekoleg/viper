#import <UIKit/UIKit.h>
#import "FeedViewInput.h"
#import "FeedViewOutput.h"

@protocol FeedPresenterInput;

/*! Слой, отвечающий за отображение RSS ленты */
@interface FeedViewController : UIViewController<FeedViewInput>

@property (nonatomic, strong) id<FeedViewOutput> output;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
