#import "FeedViewController.h"
#import "FeedTableViewDataSource.h"
#import <UIView+CLPLoading.h>
#import "FeedViewModel.h"

@interface FeedViewController ()<UITableViewDelegate>
@property (nonatomic, strong) FeedTableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation FeedViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.title = NSLocalizedString(@"feed.viewcontroller.title", nil);

	[self setupRefreshControl];

	self.tableViewDataSource = [[FeedTableViewDataSource alloc] init];

	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedRowHeight = 44.0;
	self.tableView.delegate = self;
	self.tableView.dataSource = self.tableViewDataSource;

	[self.output viewDidLoaded];
}


#pragma mark - Setup -

- (void)setupRefreshControl
{
	if (!_refreshControl)
	{
		_refreshControl = [[UIRefreshControl alloc] init];
		[_refreshControl addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
		[self.tableView addSubview:self.refreshControl];
	}
}


#pragma mark - Actions -

- (void)refreshData:(UIRefreshControl *)control
{
	[control beginRefreshing];
	[self.output reloadData];
}

#pragma mark - FeedViewInput -

- (void)showLoadingIndicator
{
	if (self.tableViewDataSource.content.count > 0)
	{
		[self.refreshControl beginRefreshing];
	}
	else
	{
		[self.view clp_showLoading];
	}
}

- (void)showRSSItems:(NSArray *)items
{
	[self.refreshControl endRefreshing];
	[self.view clp_hideAll];
	self.tableViewDataSource.content = items;
	[self.tableView reloadData];
}

- (void)showErrorMessgae:(NSString *)message
{
	__weak typeof(self) weakSelf = self;
	[self.refreshControl endRefreshing];
	[self.view clp_showError:message retryBlock:^{
		[weakSelf.output reloadData];
	}];
}


#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	FeedViewModel *model = self.tableViewDataSource.content[indexPath.row];
	model.showFullInfo = !model.showFullInfo;
	[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	FeedViewModel *model = self.tableViewDataSource.content[indexPath.row];
	[self.output didPickedViewModel:model];
}

@end
