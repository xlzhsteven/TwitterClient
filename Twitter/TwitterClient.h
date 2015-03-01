//
//  TwitterClient.h
//  Twitter
//
//  Created by Xiaolong Zhang on 2/21/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *)sharedInstance;

- (void)loginWithCompletion:(void (^)(User *user, NSError *error))completion;

- (void)openURL:(NSURL *)url;

- (void)homeTimelineWithParams:(NSDictionary *)params completion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)mentionsTimelineWithParams:(NSDictionary *)params completion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)sendTweet:(NSDictionary *)params completion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)reTweet:(NSDictionary *)params completion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)favTweet:(NSDictionary *)params completion:(void(^)(NSArray *tweets, NSError *error))completion;

- (void)unfavTweet:(NSDictionary *)params completion:(void(^)(NSArray *tweets, NSError *error))completion;
@end
