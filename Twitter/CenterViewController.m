//
//  CenterViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/26/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "CenterViewController.h"
#import "TweetsViewController.h"
#import "LeftMenuViewController.h"
#import "LeftMenuViewController.h"

@interface CenterViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *menuView;

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TweetsViewController *tweetsViewController = [[TweetsViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:tweetsViewController];
    [self.contentView addSubview:nvc.view];
    [self addChildViewController:nvc];
    
    LeftMenuViewController *lmv = [[LeftMenuViewController alloc] init];
    [self.menuView addSubview:lmv.view];
    [self addChildViewController:lmv];
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
//    LeftMenuViewController *lvc = [[LeftMenuViewController alloc] init];
//    [self.view addSubview:lvc.view];
//    [self addChildViewController:lvc];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
