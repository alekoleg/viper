//
//  FeedInteractor+Private.h
//  viper
//
//  Created by Алексеенко Олег on 17/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//
#import <Foundation/Foundation.h>

@class FeedStorageModel, MWFeedItem;

@interface FeedInteractor ()

- (NSArray<FeedStorageModel *> *)mapRSSItemsToStorageModel:(NSArray<MWFeedItem *> *)items;
- (NSArray<FeedStorageModel *> *)sortModels:(NSArray<FeedStorageModel *> *)models;

@end
