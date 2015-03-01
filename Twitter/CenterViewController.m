//
//  CenterViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/26/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "CenterViewController.h"
#import "TweetsViewController.h"
#import "ProfileCell.h"
#import "UIImageView+AFNetworking.h"
#import "User.h"
#import "ProfileViewController.h"
#define ProfileCellIndex 0
#define HomeTimeLineCellIndex 1
#define MentionsCellIndex 2

@interface CenterViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tableViewContent;
@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableViewContent = @[@"Your Profile",@"Home Timeline",@"Mentions View"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfileCell" bundle:nil] forCellReuseIdentifier:@"ProfileCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    
    TweetsViewController *tweetsViewController = [[TweetsViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:tweetsViewController];
    [self.contentView addSubview:nvc.view];
    [self addChildViewController:nvc];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    CGPoint velocity = [sender velocityInView:self.contentView];
    CGPoint endLocation = CGPointMake(400, 284);
    CGPoint beginLocation = CGPointMake(160, 284);
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"begin");
    } else if (sender.state == UIGestureRecognizerStateChanged){
        if (velocity.x > 0) {
            [UIView animateWithDuration:0.5 animations:^{
                self.contentView.center = endLocation;
            }];
        } else if (velocity.x <= 0) {
            [UIView animateWithDuration:0.5 animations:^{
                self.contentView.center = beginLocation;
            }];
        }
    }
}

#pragma mark - Table View methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableViewContent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == ProfileCellIndex) {
        ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];
        User *currentUser = [User currentuser];
        
        [cell.profileImageView setImageWithURL:[NSURL URLWithString:currentUser.profileImageUrl]];
        cell.nameLabel.text = currentUser.name;
        cell.screenNameLabel.text = [NSString stringWithFormat:@"@%@", currentUser.screenName];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = self.tableViewContent[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == HomeTimeLineCellIndex) {
        
    } else if (indexPath.row == ProfileCellIndex) {
        ProfileViewController *vc = [[ProfileViewController alloc] init];
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:nvc animated:YES completion:nil];
    } else if (indexPath.row == MentionsCellIndex) {
        
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.contentView.center = CGPointMake(160, 284);
    }];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
