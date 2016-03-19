#import <Foundation/Foundation.h>
#import "FeedViewOutput.h"
#import "FeedInteractorOutput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FeedInteractorInput, FeedRouterInput, FeedViewInput;

/*! Объект взаимодействия между слоем UI и бизнес логикой */
@interface FeedPresenter : NSObject<FeedViewOutput, FeedInteractorOutput>

/*! UI слой */
@property (nonatomic, weak) id<FeedViewInput> view;

/*! Бизнес логика */
@property (nonatomic, strong) id<FeedInteractorInput> interactor;

/*! Навигация */
@property (nonatomic, strong) id<FeedRouterInput> router;

@end

NS_ASSUME_NONNULL_END
