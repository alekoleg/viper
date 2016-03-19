#import "FeedRSSParser.h"
#import <MWFeedParser/MWFeedParser.h>

@interface FeedRSSParser ()<MWFeedParserDelegate>

@property (nonatomic, strong) MWFeedParser *parser;
@property (nonatomic, copy) FeedRSSParserSuccessBlock successBlock;
@property (nonatomic, copy) FeedRSSParserFailBlock failBlock;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation FeedRSSParser

- (instancetype)initWithLink:(NSString *)link;
{
	self = [super init];
	if (!self) return nil;

	NSCParameterAssert(link);

	self.parser = [[MWFeedParser alloc] initWithFeedURL:[NSURL URLWithString:link]];
	self.parser.delegate = self;
	self.parser.feedParseType = ParseTypeItemsOnly;

	return self;
}

- (void)parseRSSComplete:(FeedRSSParserSuccessBlock)complete
				 failure:(FeedRSSParserFailBlock)failure;
{
	self.successBlock = complete;
	self.failBlock = failure;
	[self.parser parse];
}


#pragma mark - MWFeedParserDelegate -

- (void)feedParserDidStart:(MWFeedParser *)parser
{
	self.items = [NSMutableArray array];
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
	[self.items addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser
{
	if (self.successBlock)
	{
		self.successBlock(self.items);
	}
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
	if (self.failBlock)
	{
		self.failBlock(error);
	}
}

@end
