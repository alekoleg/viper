//
//  FeedRSSService+Private.h
//  viper
//
//  Created by Алексеенко Олег on 16/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

@class FeedRSSParser;

@interface FeedRSSService ()

- (FeedRSSParser *)createParserWithLink:(NSString *)link;

@end
