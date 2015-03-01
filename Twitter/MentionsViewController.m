//
//  MentionsViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/28/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "MentionsViewController.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "TweetSimpleCell.h"
#import "TwitterClient.h"

@interface MentionsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tweets;

@end

@implementation MentionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetSimpleCell" bundle:nil] forCellReuseIdentifier:@"TweetSimpleCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    [self fetchData];
    
    self.title = @"Mentions";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDone)];
    // Do any additional setup after loading the view from its nib.
}

- (void) fetchData {
    [[TwitterClient sharedInstance] mentionsTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
        self.tweets = tweets;
        for (Tweet *tweet in tweets) {
            NSLog(@"The text of the tweet is: %@", tweet.text);
        }
        [self.tableView reloadData];
    }];
}

-(void)onDone {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Tweet *tweet = self.tweets[indexPath.row];
    TweetSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetSimpleCell"];
    cell.tweet = tweet;
    [cell.userProfileImageView setImageWithURL:[NSURL URLWithString:tweet.user.profileImageUrl]];
    cell.userProfileImageView.layer.cornerRadius = 3;
    cell.userProfileImageView.clipsToBounds = YES;
    cell.nameLabel.text = tweet.user.name;
    cell.screenNameLabel.text = [NSString stringWithFormat:@"@%@", tweet.user.screenName];
    cell.timePassedLabel.text = [NSString stringWithFormat:@"%@", tweet.createdAtString];
    cell.tweetLabel.text = tweet.text;
    return cell;
}

@end
