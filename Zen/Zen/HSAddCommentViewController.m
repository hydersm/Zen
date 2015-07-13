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

@property NSMutableArray *tempStressLineVals;
@property JBChartTooltipView *tooltipView;
@property JBChartTooltipTipView *tooltipTipView;
@property BOOL toolTipVisibleNow;

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
    
    [self.stressLineChartPlaceholder.superview addSubview:self.stressLineChartView];
    [self.stressLineChartPlaceholder removeFromSuperview];
    
    //set data
    self.tempStressLineVals = [[NSMutableArray alloc] init];
    for(int i = 0; i < 7; i++) {
        
        [self.tempStressLineVals addObject:[NSNumber numberWithInteger:arc4random_uniform(11)]];
        
    }
    
    
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
    
    NSNumber *num = self.tempStressLineVals[horizontalIndex];
    return [num floatValue];
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

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView verticalSelectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [UIColor colorWithRed:135/255.0 green:190/255.0 blue:115/255.0 alpha:1.0]; // color of selection view
}

- (CGFloat)verticalSelectionWidthForLineChartView:(JBLineChartView *)lineChartView
{
    return 20; // width of selection view
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [UIColor colorWithRed:252/255.0 green:104/255.0 blue:44/255.0 alpha:1.0]; // color of selected line
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView selectionFillColorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return [UIColor colorWithRed:254/255.0 green:212/255.0 blue:202/255.0 alpha:1.0]; // color of area under selected line
}

- (void)lineChartView:(JBLineChartView *)lineChartView didSelectLineAtIndex:(NSUInteger)lineIndex horizontalIndex:(NSUInteger)horizontalIndex touchPoint:(CGPoint)touchPoint
{
    ((UIScrollView *)self.view).scrollEnabled = NO;
    [self setTooltipVisible:YES animated:YES atTouchPoint:touchPoint];
    NSNumber *num = self.tempStressLineVals[horizontalIndex];
    [self.tooltipView setText:[num stringValue]];
    
}

- (void)didDeselectLineInLineChartView:(JBLineChartView *)lineChartView
{
    [self setTooltipVisible:NO animated:YES atTouchPoint:CGPointZero];
    ((UIScrollView *)self.view).scrollEnabled = YES;
}

#pragma mark tool tip

- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated atTouchPoint:(CGPoint)touchPoint
{
    
    self.toolTipVisibleNow = tooltipVisible;
    JBChartView *chartView = self.stressLineChartView;
    
    if (!chartView)
    {
        return;
    }
    
    if (!self.tooltipView)
    {
        self.tooltipView = [[JBChartTooltipView alloc] init];
        self.tooltipView.alpha = 0.0;
        self.tooltipView.backgroundColor = [UIColor colorWithRed:135/255.0 green:190/255.0 blue:115/255.0 alpha:1];
        [self.view addSubview:self.tooltipView];
    }
    
    [self.view bringSubviewToFront:self.tooltipView];
    
    if (!self.tooltipTipView)
    {
        self.tooltipTipView = [[JBChartTooltipTipView alloc] init];
        self.tooltipTipView.alpha = 0.0;
        [self.view addSubview:self.tooltipTipView];
    }
    
    [self.view bringSubviewToFront:self.tooltipTipView];
    
    dispatch_block_t adjustTooltipPosition = ^{
        CGPoint originalTouchPoint = [self.view convertPoint:touchPoint fromView:chartView];
        CGPoint convertedTouchPoint = originalTouchPoint; // modified
        JBChartView *chartView = self.stressLineChartView;
        if (chartView)
        {
            CGFloat minChartX = (chartView.frame.origin.x + ceil(self.tooltipView.frame.size.width * 0.5));
            if (convertedTouchPoint.x < minChartX)
            {
                convertedTouchPoint.x = minChartX;
            }
            CGFloat maxChartX = (chartView.frame.origin.x + chartView.frame.size.width - ceil(self.tooltipView.frame.size.width * 0.5));
            if (convertedTouchPoint.x > maxChartX)
            {
                convertedTouchPoint.x = maxChartX;
            }
            self.tooltipView.frame = CGRectMake(convertedTouchPoint.x - ceil(self.tooltipView.frame.size.width * 0.5), CGRectGetMaxY(chartView.headerView.frame) + 40, self.tooltipView.frame.size.width, self.tooltipView.frame.size.height);
            
            CGFloat minTipX = (chartView.frame.origin.x + self.tooltipTipView.frame.size.width);
            if (originalTouchPoint.x < minTipX)
            {
                originalTouchPoint.x = minTipX;
            }
            CGFloat maxTipX = (chartView.frame.origin.x + chartView.frame.size.width - self.tooltipTipView.frame.size.width);
            if (originalTouchPoint.x > maxTipX)
            {
                originalTouchPoint.x = maxTipX;
            }
            self.tooltipTipView.frame = CGRectMake(originalTouchPoint.x - ceil(self.tooltipTipView.frame.size.width * 0.5), CGRectGetMaxY(self.tooltipView.frame), self.tooltipTipView.frame.size.width, self.tooltipTipView.frame.size.height);
        }
    };
    
    dispatch_block_t adjustTooltipVisibility = ^{
        self.tooltipView.alpha = tooltipVisible ? 1.0 : 0.0;
        self.tooltipTipView.alpha = tooltipVisible ? 1.0 : 0.0;
    };
    
    if (tooltipVisible)
    {
        adjustTooltipPosition();
    }
    
    if (animated)
    {
        [UIView animateWithDuration:0.25f animations:^{
            adjustTooltipVisibility();
        } completion:^(BOOL finished) {
            if (!tooltipVisible)
            {
                adjustTooltipPosition();
            }
        }];
    }
    else
    {
        adjustTooltipVisibility();
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
