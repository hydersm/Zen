//
//  HSGraphViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-19.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSGraphViewController.h"

@interface HSGraphViewController ()

@end

@implementation HSGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib
    ((UIScrollView *)self.view).contentSize = self.view.frame.size;
    self.navigationItem.title = @"Analytics";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelButtonPressed)];
    
    self.stressLineChartContainer = [[HSLineChartContainer alloc] initWithPlaceholderView:self.stressLineChartPlaceholder chartType:STRESS_CHART];
    self.stressLineChartContainer.scrollView = ((UIScrollView *)self.view);
    
    self.hrLineChartContainer = [[HSLineChartContainer alloc] initWithPlaceholderView:self.hrLineChartPlaceholder chartType:BPM_CHART];
    self.hrLineChartContainer.scrollView = ((UIScrollView *)self.view);
    
    self.ibiLineChartContainer = [[HSLineChartContainer alloc] initWithPlaceholderView:self.ibiLineChartPlaceholder chartType:IBI_CHART];
    self.ibiLineChartContainer.scrollView = ((UIScrollView *)self.view);
    
    self.gsrLineChartContainer = [[HSLineChartContainer alloc] initWithPlaceholderView:self.gsrLineChartPlaceholder chartType:GSR_CHART];
    self.gsrLineChartContainer.scrollView = ((UIScrollView *)self.view);
    
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
