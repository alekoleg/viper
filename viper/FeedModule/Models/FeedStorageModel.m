#import "FeedStorageModel.h"

@implementation FeedStorageModel

- (instancetype)initWithSource:(NSString *)source
					 imageLink:(NSString *)imageLink
						 title:(NSString *)title
						  text:(NSString *)text
						  date:(NSDate *)date
{
	self = [super init];
	if (!self) return nil;

	_source = [source copy];
	_imageLink = [imageLink copy];
	_title = [title copy];
	_text = [text copy];
	_date = date;

	return self;
}

@end
