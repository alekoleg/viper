//
//  FeedRouter.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FeedRouterInput.h"

@class FeedViewController;
@interface FeedRouter : NSObject<FeedRouterInput>

+ (UIViewController *)createFeedViewController;


@end
