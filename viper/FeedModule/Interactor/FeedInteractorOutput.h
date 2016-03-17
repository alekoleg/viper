//
//  FeedInteractorOutput.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

@class FeedStorageModel;
@protocol FeedInteractorOutput <NSObject>

- (void)didFetchedRSSItems:(NSArray<FeedStorageModel *> *)items;
- (void)didFailToFetchRSSItems:(NSError *)error;

@end
