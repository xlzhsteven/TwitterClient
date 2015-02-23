//
//  Tweet.h
//  Twitter
//
//  Created by Xiaolong Zhang on 2/21/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) int minPassed;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *favoriteCount;
@property (nonatomic, strong) NSString *retweetCount;
@property (nonatomic, strong) NSString *idString;
@property (nonatomic, assign) NSNumber *favTrack;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)tweetsWithArray:(NSArray *)array;
@end
