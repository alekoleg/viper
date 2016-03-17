//
//  FeedInteractor.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedInteractorOutput.h"
#import "FeedInteractorInput.h"
#import "FeedRSSServiceOutput.h"

@protocol FeedRSSServiceInput;

@interface FeedInteractor : NSObject<FeedRSSServiceOutput, FeedInteractorInput>

@property (nonatomic, weak) id<FeedInteractorOutput> output;
@property (nonatomic, strong) id<FeedRSSServiceInput> service;

@end
