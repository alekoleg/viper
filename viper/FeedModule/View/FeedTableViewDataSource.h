//
//  FeedTableViewDataSource.h
//  viper
//
//  Created by Алексеенко Олег on 18/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FeedTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSArray *content;

@end
