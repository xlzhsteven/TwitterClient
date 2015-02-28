//
//  ProfileCell.h
//  Twitter
//
//  Created by Xiaolong Zhang on 2/28/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

@end
