//
//  TweetSimpleCell.h
//  Twitter
//
//  Created by Xiaolong Zhang on 2/22/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
@class TweetSimpleCell;

@protocol TweetSimpleCellDelegate <NSObject>

- (void)TweetSimpleCell:(TweetSimpleCell *)tweetSimpleCell onFavorite:(BOOL)value;
- (void)TweetSimpleCell:(TweetSimpleCell *)tweetSimpleCell onReply:(Tweet *)tweet;
- (void)TweetSimpleCell:(TweetSimpleCell *)tweetSimpleCell onRetweet:(BOOL)value;
- (void)TweetSimpleCell:(TweetSimpleCell *)tweetSimpleCell onTap:(Tweet *)tweet;

@end

@interface TweetSimpleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timePassedLabel;
@property (nonatomic, strong) Tweet * tweet;
@property (nonatomic, weak) id<TweetSimpleCellDelegate> delegate;
@end
