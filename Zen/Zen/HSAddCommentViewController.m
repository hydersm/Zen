//
//  HSAddCommentViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSAddCommentViewController.h"
#import "HSUIUtils.h"

@interface HSAddCommentViewController ()

@property HSLineChartContainer *lineChartContainer;

@end

@implementation HSAddCommentViewController

- (id)init {
    
    return [super initWithNibName:@"HSAddCommentViewController" bundle:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ((UIScrollView *)self.view).contentSize = self.view.frame.size;
    self.navigationItem.title = @"Add Comment";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelButtonPressed)];
    
    
    //additional button setup
    for (UIButton *button in self.question1ButtonCollection) {
        
        [HSUIUtils setUpButton:button];
        
    }
    for (UIButton *button in self.question2ButtonCollection) {
        
        [HSUIUtils setUpButton:button];
        
    }
    
    //stress graph
    self.lineChartContainer = [[HSLineChartContainer alloc] initWithPlaceholderView:self.stressLineChartPlaceholder chartType:STRESS_CHART];
    self.lineChartContainer.scrollView = ((UIScrollView *)self.view);
    
    [HSUIUtils setUpButton:self.submitButton];
    
}

- (IBAction)question1ButtonPressed:(id)sender {
    
    for(UIButton *button in self.question1ButtonCollection) {
        button.selected = NO;
    }
    
    ((UIButton *) sender).selected = YES;
    
    
}

- (IBAction)question2ButtonPressed:(id)sender {
    
    for(UIButton *button in self.question2ButtonCollection) {
        button.selected = NO;
    }
    
    ((UIButton *) sender).selected = YES;
    
}

- (IBAction)submitButtonPressed:(id)sender {
    
    //TODO:Implement Submit
    [self cancelButtonPressed];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    //***add graph here
    
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
