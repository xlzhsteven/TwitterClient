//
//  TweetDetailViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/22/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TwitterClient.h"
#import "ComposeTweetViewController.h"

@interface TweetDetailViewController ()
@property (weak, nonatomic) IBOutlet UIButton *favIcon;
@property (nonatomic, assign) int favTrack;
@end

@implementation TweetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goBackToComposeVC)];
    self.title = @"Tweet";
    if ([self.tweet.favTrack integerValue] == 1 || self.favTrack == 1) {
        [self.favIcon setBackgroundImage:[UIImage imageNamed:@"favOn"] forState:UIControlStateNormal];
    }
    
    self.profileImageUrl = self.tweet.user.profileImageUrl;
    self.nameLabel.text = self.tweet.user.name;
    self.screenNameLabel.text = [NSString stringWithFormat:@"@%@", self.tweet.user.screenName];
    self.numOfFavLabel.text = self.tweet.favoriteCount;
    self.numOfRetweetsLabel.text = self.tweet.retweetCount;
    self.tweetContentLabel.text = self.tweet.text;
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.profileImageUrl]];
    self.profileImageView.layer.cornerRadius = 3;
    self.profileImageView.clipsToBounds = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBackToComposeVC {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onReply:(id)sender {
    ComposeTweetViewController *vc = [[ComposeTweetViewController alloc] init];
    vc.tweet = self.tweet;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
    
}
- (IBAction)onRetweet:(id)sender {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.tweet.idString forKey:@"id"];
    [[TwitterClient sharedInstance] reTweet:params completion:nil];
}
- (IBAction)onFav:(id)sender {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
