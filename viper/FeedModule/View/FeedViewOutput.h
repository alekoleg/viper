//
//  FeedViewOutput.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

@class FeedViewModel;
@protocol FeedViewOutput <NSObject>

- (void)viewDidLoaded;

- (void)reloadData;

- (void)didPickedViewModel:(FeedViewModel *)model;

@end