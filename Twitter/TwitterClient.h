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

@end
