//
//  ProfileViewController.m
//  Twitter
//
//  Created by Xiaolong Zhang on 2/28/15.
//  Copyright (c) 2015 Xiaolong Zhang. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileHeaderCell.h"
#import "ProfileTFFCell.h"
#import "User.h"
#define HeaderIndex 0
#define TFFIndex 1
@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.title = @"Me";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDone)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfileTFFCell" bundle:nil] forCellReuseIdentifier:@"ProfileTFFCell"];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ProfileHeaderCell" bundle:nil] forCellReuseIdentifier:@"ProfileHeaderCell"];
    self.tableView.rowHeight = 180;
    // Do any additional setup after loading the view from its nib.
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == HeaderIndex) {
        ProfileHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileHeaderCell"];
        cell.user = [User currentuser];
        return cell;
    } else if (indexPath.row == TFFIndex) {
        ProfileTFFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileTFFCell"];
        self.tableView.rowHeight = 44;
        cell.user = [User currentuser];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
}


@end
