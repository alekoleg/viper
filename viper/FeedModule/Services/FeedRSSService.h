//
//  FeedRSSService.h
//  viper
//
//  Created by Алексеенко Олег on 15/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedRSSServiceInput.h"
#import "FeedRSSServiceOutput.h"

@interface FeedRSSService : NSObject<FeedRSSServiceInput>

@property (nonatomic, weak) id<FeedRSSServiceOutput> output;

@end
