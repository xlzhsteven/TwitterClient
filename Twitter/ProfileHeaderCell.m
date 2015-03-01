//
//  ProfileHeaderCell.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/28/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "ProfileHeaderCell.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileHeaderCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileBackgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@end

@implementation ProfileHeaderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(User *)user {
    _user = user;
    [self.profileBackgroundImageView setImageWithURL:[NSURL URLWithString:self.user.profileBackgroundImageUrl]];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.user.profileImageUrl]];
    self.nameLabel.text = self.user.name;
    self.screenNameLabel.text = [NSString stringWithFormat:@"@%@", self.user.screenName];
}
@end
