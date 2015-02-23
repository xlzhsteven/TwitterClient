//
//  ComposeTweetViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/22/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "ComposeTweetViewController.h"
#import "TweetsViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"
#import "TwitterClient.h"

@interface ComposeTweetViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *userEntryTextField;
@property (strong, nonatomic) User *currentUser;

@end

@implementation ComposeTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton *sendTweetbutton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [sendTweetbutton setImage:[UIImage imageNamed:@"sendTweetButton.png"] forState:UIControlStateNormal];
    [sendTweetbutton addTarget:self action:@selector(onSend:) forControlEvents:UIControlEventTouchUpInside];
    [sendTweetbutton setFrame:CGRectMake(0, 0, 32, 32)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sendTweetbutton];
    
    UIButton *cancelTweetbutton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelTweetbutton setImage:[UIImage imageNamed:@"cancelTweetButton.png"] forState:UIControlStateNormal];
    [cancelTweetbutton addTarget:self action:@selector(onCancel) forControlEvents:UIControlEventTouchUpInside];
    [cancelTweetbutton setFrame:CGRectMake(0, 0, 32, 32)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancelTweetbutton];
    
    self.currentUser = [User currentuser];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.currentUser.profileImageUrl]];
    self.profileImageView.layer.cornerRadius = 3;
    self.profileImageView.clipsToBounds = YES;
    self.screenNameLabel.text = self.currentUser.screenName;
    self.nameLabel.text = self.currentUser.name;
    if (self.tweet) {
        self.userEntryTextField.text = [NSString stringWithFormat:@"@%@", self.tweet.user.screenName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onSend:(UIButton *)sender {
    NSString *content = self.userEntryTextField.text;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:content forKey:@"status"];
    [[TwitterClient sharedInstance] sendTweet:params completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
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
