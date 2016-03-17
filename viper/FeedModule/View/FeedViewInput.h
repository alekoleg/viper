//
//  FeedViewInput.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

@protocol FeedViewInput <NSObject>

- (void)showLoadingIndicator;
- (void)showRSSItems:(NSArray *)items;
- (void)showErrorMessgae:(NSError *)error;

@end