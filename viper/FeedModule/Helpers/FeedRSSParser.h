//
//  FeedRSSParser.h
//  viper
//
//  Created by Алексеенко Олег on 17/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MWFeedInfo;

typedef void(^FeedRSSParserSuccessBlock)(NSArray<MWFeedInfo *> *items);
typedef void(^FeedRSSParserFailBlock)(NSError *error);

@interface FeedRSSParser : NSObject

- (instancetype)initWithLink:(NSString *)link;


- (void)parseRSSFeed:(NSString *)link
			 success:(FeedRSSParserSuccessBlock)success
			failure:(FeedRSSParserFailBlock)failure;

@end
