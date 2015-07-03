//
//  ViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

// set view property
- (void)loadView {
    self.view = [[UIView alloc] init];
}

// after view is loaded, do any non view customization
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Zen";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    
}

//view has resized, add subviews here
- (void)viewWillAppear:(BOOL)animated {
    
    UILabel *tempView = [[UILabel alloc] initWithFrame:self.view.bounds];
    tempView.text = @"main view";
    tempView.textColor = [UIColor blackColor];
    [self.view addSubview:tempView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
