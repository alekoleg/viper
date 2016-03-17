//
//  FeedInteractorTest.m
//  viper
//
//  Created by Алексеенко Олег on 17/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import <MWFeedItem.h>
#import "FeedInteractor.h"
#import "FeedInteractor+Private.h"
#import "FeedStorageModel.h"

SPEC_BEGIN(FeedInteractorTest2)

describe(@"Interactor", ^{

	__block FeedInteractor *interactor = nil;
	__block KWMock<FeedInteractorOutput> *output = nil;
	__block NSArray<FeedStorageModel *> *models = nil;
	__block NSArray<MWFeedItem *> *items = nil;

	beforeEach(^{
		interactor = [[FeedInteractor alloc] init];
		output = [KWMock mockForProtocol:@protocol(FeedInteractorOutput)];
		interactor.output = output;

		models = @[
				   [[FeedStorageModel alloc] initWithSource:@""
												  imageLink:@""
													  title:@"test"
													   text:@"text"
													   date:[NSDate date]],
				   [[FeedStorageModel alloc] initWithSource:@""
												  imageLink:@""
													  title:@"test2"
													   text:@"text2"
													   date:[[NSDate date] dateByAddingTimeInterval:10]],
				   ];

		MWFeedItem *item1 = [[MWFeedItem alloc] init];
		item1.title = @"test";
		item1.summary = @"text";
		item1.date = [NSDate date];

		MWFeedItem *item2 = [[MWFeedItem alloc] init];
		item2.title = @"test2";
		item2.summary = @"text2";
		item2.date = [[NSDate date] dateByAddingTimeInterval:10];

		items = @[ item1, item2 ];
	});

	it(@"Should properly initialize", ^{

		[[interactor should] beNonNil];
	});

	it(@"Should proccess items from service to output", ^{

		[[output should] receive:@selector(didFetchedRSSItems:)];
		[interactor rssServiceDidLoadItems:items];
	});

	it(@"Should proccess error from service to output", ^{

		[[output should] receive:@selector(didFailToFetchRSSItems:)];
		[interactor rssServiceDidFailToLoadItems:[NSError nullMock]];
	});

	it(@"Should sort models", ^{

		void(^matchBlock)(FeedStorageModel *, FeedStorageModel *) = ^(FeedStorageModel *model1, FeedStorageModel *model2)
		{
			[[theValue([model1.date compare:model2.date]) should] equal:theValue(NSOrderedAscending)];
		};
		matchBlock(models[0], models[1]);

		models = [interactor sortModels:models];

		matchBlock(models[1], models[0]);
	});

	it(@"Should sort models", ^{

		NSArray *results = [interactor mapRSSItemsToStorageModel:items];

		[[theValue(results.count) should] equal:theValue(items.count)];
		[results enumerateObjectsUsingBlock:^(FeedStorageModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			[[NSStringFromClass(obj.class) should] equal:NSStringFromClass([FeedStorageModel class])];
		}];

	});

});

SPEC_END