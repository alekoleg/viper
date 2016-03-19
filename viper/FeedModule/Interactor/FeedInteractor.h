#import <Foundation/Foundation.h>
#import "FeedInteractorOutput.h"
#import "FeedInteractorInput.h"
#import "FeedRSSServiceOutput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FeedRSSServiceInput;

/*! Объект в котором проиходит бизнесс логика (загрузка данных, их обработка) */
@interface FeedInteractor : NSObject<FeedRSSServiceOutput, FeedInteractorInput>

/*! В output выводятся данные работы */
@property (nonatomic, weak) id<FeedInteractorOutput> output;

/*! Сервис, который отвечает за работу с лентой */
@property (nonatomic, strong) id<FeedRSSServiceInput> service;

@end

NS_ASSUME_NONNULL_END
