//
//  VRMediaViewController.m
//  Top100s
//
//  Created by Vlad-R on 11/11/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

#import "VRMediaViewController.h"

#import "UIView+Activity.h"
#import "VRApps.h"
#import "VREntry.h"
#import "VRMediaTableViewCell.h"
#import "VRMediaViewModel.h"

static NSString *kMediaCellID = @"media_cell_id";

@interface VRMediaViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation VRMediaViewController

- (void)awakeFromNib {
    self.viewModel = [[VRMediaViewModel alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.activityViewVisible = YES;
    __weak typeof(self) weakSelf = self;
    [self.viewModel fetchModel:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            weakSelf.view.activityViewVisible = NO;
        });
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.model.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    VREntry *entry = self.viewModel.model.entries[indexPath.row];
    
    VRMediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMediaCellID];
    
    //Customize cell
    
    return cell;
}

@end