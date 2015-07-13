//
//  HSSettingsViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-13.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSSettingsViewController.h"

@interface HSSettingsViewController ()

@end

@implementation HSSettingsViewController

- (void)loadView {
    
    self.view = [[UIView alloc] init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Settings";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelButtonPressed)];
    
}

- (void)cancelButtonPressed {
    
    [HSUIUtils popViewControllerFromNavigationController:self.navigationController withTopToBottomAnimation:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
