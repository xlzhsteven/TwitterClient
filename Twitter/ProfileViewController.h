//
//  ProfileViewController.h
//  Twitter
//
//  Created by Xiaolong Zhang on 2/28/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class User;
@interface ProfileViewController : UIViewController
@property (nonatomic, strong) User *caller;
@end
