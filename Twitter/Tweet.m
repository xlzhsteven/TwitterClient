//
//  Tweet.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/21/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "Tweet.h"

@interface Tweet ()
@property (nonatomic, strong) NSDate *createdAt;
@end

@implementation Tweet

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        self.text = dictionary[@"text"];
        
        NSNumber *retweetNumber = dictionary[@"retweet_count"];
        self.retweetCount = [retweetNumber stringValue];
        NSNumber *favNumber = dictionary[@"favorite_count"];
        self.favoriteCount = [favNumber stringValue];
        self.idString = dictionary[@"id_str"];
        self.favTrack = dictionary[@"favorited"];
        
        NSString *createdAtString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        self.createdAt = [formatter dateFromString:createdAtString];
        
        NSDateFormatter *printDateFormatter = [[NSDateFormatter alloc] init];
        [printDateFormatter setDateStyle:NSDateFormatterShortStyle];
        [printDateFormatter setTimeStyle:NSDateFormatterNoStyle];
        self.createdAtString = [printDateFormatter stringFromDate:self.createdAt];
        
        NSDate *now = [NSDate date];
        self.minPassed = [now timeIntervalSinceDate:self.createdAt]/60;
    }
    return self;
}

+ (NSArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:dict]];
    }
    
    return tweets;
}

@end
