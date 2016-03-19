//
//  FeedTableViewDataSource.m
//  viper
//
//  Created by Алексеенко Олег on 18/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import "FeedTableViewDataSource.h"
#import "FeedCell.h"
#import "FeedViewModel.h"

static NSString * const FeedCellIdentifier = @"FeedCellIdentifier";


@implementation FeedTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:FeedCellIdentifier];
	cell.accessoryType = UITableViewCellAccessoryDetailButton;
	FeedViewModel *model = self.content[indexPath.row];
	[cell updateWithViewModel:model];
	return cell;
}

@end
