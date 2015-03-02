//
//  TweetSimpleCell.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/22/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "TweetSimpleCell.h"
#import "ComposeTweetViewController.h"
#import "TwitterClient.h"
#import "ProfileViewController.h"
#import "TweetsViewController.h"

@interface TweetSimpleCell ()
@property (weak, nonatomic) IBOutlet UIButton *favIcon;
@property (nonatomic, assign) int favTrack;
@end
@implementation TweetSimpleCell

- (void)awakeFromNib {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    singleTap.numberOfTapsRequired = 1;
    [self.userProfileImageView setUserInteractionEnabled:YES];
    [self.userProfileImageView addGestureRecognizer:singleTap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onReply:(id)sender {
    [self.delegate TweetSimpleCell:self onReply:self.tweet];
}

- (IBAction)onRetweet:(id)sender {
    [self.delegate TweetSimpleCell:self onRetweet:YES];
}

- (IBAction)onFavorite:(id)sender {
    [self.delegate TweetSimpleCell:self onFavorite:YES];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.tweet.idString forKey:@"id"];
    if ([self.tweet.favTrack integerValue] == 0) {
        [[TwitterClient sharedInstance] favTweet:params completion:nil];
        self.favTrack = 1;
        self.tweet.favTrack = [NSNumber numberWithInt:1];
        [self.favIcon setImage:[UIImage imageNamed:@"favOn"] forState:UIControlStateNormal];
    } else {
        self.favTrack = 0;
        self.tweet.favTrack = [NSNumber numberWithInt:0];
        [self.favIcon setImage:[UIImage imageNamed:@"favorites"] forState:UIControlStateNormal];
        [[TwitterClient sharedInstance] unfavTweet:params completion:nil];
    }
}

- (void) onTap {
    [self.delegate TweetSimpleCell:self onTap:self.tweet];
}

@end
