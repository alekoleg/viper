//
//  FeedRSSServiceTest.m
//  viper
//
//  Created by Алексеенко Олег on 16/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import "FeedRSSParser.h"
#import "FeedRSSService.h"
#import "FeedRSSService+Private.h"
#import <MWFeedItem.h>

SPEC_BEGIN(FeedRSSServiceSpec)

describe(@"Service", ^{
	__block FeedRSSService *service = nil;
	__block FeedRSSParser *parserMock = nil;

	beforeEach(^{
		service = [[FeedRSSService alloc] init];
		parserMock = [KWMock mockForClass:[FeedRSSParser class]];
	});

	it(@"Shoud be initialized", ^{

		[[service should] beNonNil];
	});

	it(@"Creates parser", ^{

		[[[service createParserWithLink:@"http://test.com/rss"] should] beNonNil];
	});
	
	it(@"Should successfuly load data", ^{

		KWMock<FeedRSSServiceOutput> *output = [KWMock mockForProtocol:@protocol(FeedRSSServiceOutput)];
		service.output = output;
		[service stub:@selector(createParserWithLink:) andReturn:parserMock];
		[parserMock stub:@selector(parseRSSComplete:failure:) withBlock:^id(NSArray *params) {
			void (^complete)(NSArray *) = params[0];
			complete(@[ [MWFeedItem new] ]);
			return nil;
		}];

		[[output should] receive:@selector(rssServiceDidLoadItems:)];
		[service loadRSSItems];
	});

	it(@"Should fail to load data", ^{
		KWMock<FeedRSSServiceOutput> *output = [KWMock mockForProtocol:@protocol(FeedRSSServiceOutput)];
		service.output = output;
		[service stub:@selector(createParserWithLink:) andReturn:parserMock];
		[parserMock stub:@selector(parseRSSComplete:failure:) withBlock:^id(NSArray *params) {
			void (^complete)(NSError *) = params[1];
			complete([NSError nullMock]);
			return nil;
		}];

		[[output should] receive:@selector(rssServiceDidFailToLoadItems:)];
		[service loadRSSItems];
	});
});

SPEC_END;
