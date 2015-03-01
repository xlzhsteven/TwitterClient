//
//  ProfileTFFCell.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/28/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "ProfileTFFCell.h"
#import "User.h"

@interface ProfileTFFCell ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UILabel *tweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;

@end
@implementation ProfileTFFCell

- (void)awakeFromNib {
    // Initialization code
    self.leftView.layer.borderColor = [UIColor grayColor].CGColor;
    self.leftView.layer.borderWidth = 1.0f;
    self.rightView.layer.borderColor = [UIColor grayColor].CGColor;
    self.rightView.layer.borderWidth = 1.0f;
    self.middleView.layer.borderColor = [UIColor grayColor].CGColor;
    self.middleView.layer.borderWidth = 1.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(User *)user {
    _user = user;
    self.tweetCountLabel.text = [self.user.tweetCount stringValue];
    self.followersCountLabel.text = [self.user.followersCount stringValue];
    self.followingsCountLabel.text = [self.user.followingCount stringValue];
}

@end
