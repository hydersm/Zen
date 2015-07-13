//
//  HSAddCommentViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSAddCommentViewController.h"
#import "HSUIUtils.h"
#import "JBLineChartView.h"
#import "JBLineChartFooterView.h"

CGFloat const kJBAreaChartViewControllerChartHeight = 250.0f;
CGFloat const kJBAreaChartViewControllerChartPadding = 10.0f;
CGFloat const kJBAreaChartViewControllerChartHeaderHeight = 75.0f;
CGFloat const kJBAreaChartViewControllerChartHeaderPadding = 20.0f;
CGFloat const kJBAreaChartViewControllerChartFooterHeight = 20.0f;
CGFloat const kJBAreaChartViewControllerChartLineWidth = 2.0f;
NSInteger const kJBAreaChartViewControllerMaxNumChartPoints = 12;

@interface HSAddCommentViewController ()

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
    [HSUIUtils setUpButton:self.submitButton];
    
    //add dummy line chart
    self.stressLineChartView = [[JBLineChartView alloc] initWithFrame:self.stressLineChartPlaceholder.frame];
    self.stressLineChartView.dataSource = self;
    self.stressLineChartView.delegate = self;
    
    JBLineChartFooterView *footerView = [[JBLineChartFooterView alloc] initWithFrame:CGRectMake(kJBAreaChartViewControllerChartPadding, ceil(self.view.bounds.size.height * 0.5) - ceil(kJBAreaChartViewControllerChartFooterHeight * 0.5), self.view.bounds.size.width - (kJBAreaChartViewControllerChartPadding * 2), kJBAreaChartViewControllerChartFooterHeight)];
    footerView.backgroundColor = [UIColor clearColor];
    footerView.leftLabel.text = @"Monday";
    footerView.leftLabel.textColor = [UIColor grayColor];
    footerView.rightLabel.text = @"Sunday";
    footerView.rightLabel.textColor = [UIColor grayColor];
    footerView.sectionCount = 7;
    self.stressLineChartView.footerView = footerView;
    
    [self.stressLineChartView setMaximumValue:13];
    [self.stressLineChartView setMinimumValue:0];
    
    self.stressLineChartView.showsLineSelection = NO;
    self.stressLineChartView.showsVerticalSelection = NO;
    
    [self.stressLineChartPlaceholder.superview addSubview:self.stressLineChartView];
    [self.stressLineChartPlaceholder removeFromSuperview];
    [self.stressLineChartView reloadData];
    
    
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

#pragma mark Line Chart Stuff
- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView {
    return 1;
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex {
    return 7;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex {
    
    return arc4random_uniform(11);
    
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex {
    return [UIColor colorWithRed:252/255.0 green:104/255.0 blue:44/255.0 alpha:1.0];
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView fillColorForLineAtLineIndex:(NSUInteger)lineIndex {
    return [UIColor colorWithRed:254/255.0 green:212/255.0 blue:202/255.0 alpha:1.0];
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex {
    return 0.5f;
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
