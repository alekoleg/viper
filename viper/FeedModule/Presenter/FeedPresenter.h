//
//  FeedPresenter.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedViewOutput.h"
#import "FeedInteractorOutput.h"

@protocol FeedInteractorInput, FeedRouterInput, FeedViewInput;

@interface FeedPresenter : NSObject<FeedViewOutput, FeedInteractorOutput>

@property (nonatomic, weak) id<FeedViewInput> view;
@property (nonatomic, strong) id<FeedInteractorInput> interactor;
@property (nonatomic, strong) id<FeedRouterInput> router;

@end
