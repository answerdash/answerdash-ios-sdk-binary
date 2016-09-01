//
//  FirstViewController.m
//  AnswerDashDemo
//
//  Created by Harry Soehalim on 9/1/16.
//  Copyright © 2016 AnswerDash, Inc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [AnswerDash setAppState:@"mobileapp"];
    [self.tableView addAnswerDashButton];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
