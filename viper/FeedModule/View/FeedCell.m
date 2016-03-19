//
//  FeedCell.m
//  viper
//
//  Created by Алексеенко Олег on 18/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import "FeedCell.h"
#import "FeedViewModel.h"
#import <UIImageView+AFNetworking.h>

@implementation FeedCell

- (void)updateWithViewModel:(FeedViewModel *)model
{
	self.titleLabel.text = model.title;
	self.fullTextLabel.text = model.showFullInfo ?  model.longText : nil;
	[self.pictureView setImageWithURL:model.imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
	self.siteLabel.text = model.siteDisplayName;
	self.dateLabel.text = model.formattedDate;
}

- (void)prepareForReuse
{
	[super prepareForReuse];
	[self.pictureView cancelImageDownloadTask];
}



@end
