//
//  FeedViewController.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedViewInput.h"
#import "FeedViewOutput.h"

@protocol FeedPresenterInput;

@interface FeedViewController : UIViewController<FeedViewInput>

@property (nonatomic, strong) id<FeedViewOutput> output;

@end
