//
//  FeedViewModel.h
//  viper
//
//  Created by Алексеенко Олег on 16/03/16.
//  Copyright © 2016 alekoleg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedViewModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *longText;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSString *site;
@property (nonatomic, strong) NSString *formattedDate;

@end
