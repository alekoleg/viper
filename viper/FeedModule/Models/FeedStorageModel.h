//
//  FeedStorageModel.h
//  viper
//
//  Created by Алексеенко Олег on 16/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedStorageModel : NSObject

@property (nonatomic, copy, readonly) NSString *source;
@property (nonatomic, copy, readonly, nullable) NSString *imageLink;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSDate *date;

- (instancetype)initWithSource:(NSString *)source
					 imageLink:( NSString * _Nullable )imageLink
						 title:(NSString *)title
						  text:(NSString *)text
						  date:(NSDate *)date;
@end

NS_ASSUME_NONNULL_END
