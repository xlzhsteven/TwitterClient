//
//  TweetsViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/21/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "TweetsViewController.h"
#import "ComposeTweetViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetSimpleCell.h"
#import "UIImageView+AFNetworking.h"

@interface TweetsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tweets;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetSimpleCell" bundle:nil] forCellReuseIdentifier:@"TweetSimpleCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    self.title = @"Tweets";
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"Log out" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
    
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"composeButton.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(composeTweet) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 32, 32)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [self fetchData];
    
    // Pull to refresh
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)composeTweet {
    ComposeTweetViewController *vc = [[ComposeTweetViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void) fetchData {
    [[TwitterClient sharedInstance] homeTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
        self.tweets = tweets;
        for (Tweet *tweet in tweets) {
            NSLog(@"The text of the tweet is: %@", tweet.text);
        }
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}

- (void)refresh: (UIRefreshControl *)refresh {
    [self fetchData];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Updating"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logOut {
    [User logOut];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table View methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Tweet *tweet = self.tweets[indexPath.row];
    TweetSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetSimpleCell"];
    [cell.userProfileImageView setImageWithURL:[NSURL URLWithString:tweet.user.profileImageUrl]];
    cell.nameLabel.text = tweet.user.name;
    cell.screenNameLabel.text = [NSString stringWithFormat:@"@%@", tweet.user.screenName];
    cell.timePassedLabel.text = [NSString stringWithFormat:@"%dm", tweet.minPassed];
    cell.tweetLabel.text = tweet.text;
    return cell;
}


@end
