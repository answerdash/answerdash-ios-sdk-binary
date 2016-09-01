//
//  SecondViewController.m
//  AnswerDashDemo
//
//  Created by Harry Soehalim on 9/1/16.
//  Copyright © 2016 AnswerDash, Inc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AnswerDashButton *myAnswerDashButton = [AnswerDashButton new];
    myAnswerDashButton.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:myAnswerDashButton];

    NSLayoutConstraint* rightConstraint = [NSLayoutConstraint constraintWithItem:self.view
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:myAnswerDashButton
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1
                                                                        constant:20];

    NSLayoutConstraint* bottomConstraint = [NSLayoutConstraint constraintWithItem:self.view
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:myAnswerDashButton
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1
                                                                         constant:70];

    [self.view addConstraint:rightConstraint];
    [self.view addConstraint:bottomConstraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
