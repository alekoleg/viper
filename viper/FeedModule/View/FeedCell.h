//
//  FeedCell.h
//  viper
//
//  Created by Алексеенко Олег on 18/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeedViewModel;
@interface FeedCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *pictureView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *fullTextLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *siteLabel;

- (void)updateWithViewModel:(FeedViewModel *)model;

@end
