//
//  TweetDetailViewController.h
//  Twitter
//
//  Created by Xiaolong Zhang on 2/22/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetDetailViewController : UIViewController

@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *numOfRetweetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numOfFavLabel;
@property (strong, nonatomic) NSString *profileImageUrl;

@end
