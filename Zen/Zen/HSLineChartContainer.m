//
//  LineChartContainer.m
//  Zen
//
//  Created by Hyder SM on 2015-07-19.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSLineChartContainer.h"

CGFloat const kJBAreaChartViewControllerChartHeight = 250.0f;
CGFloat const kJBAreaChartViewControllerChartPadding = 10.0f;
CGFloat const kJBAreaChartViewControllerChartHeaderHeight = 75.0f;
CGFloat const kJBAreaChartViewControllerChartHeaderPadding = 20.0f;
CGFloat const kJBAreaChartViewControllerChartFooterHeight = 20.0f;
CGFloat const kJBAreaChartViewControllerChartLineWidth = 2.0f;
NSInteger const kJBAreaChartViewControllerMaxNumChartPoints = 12;

@interface HSLineChartContainer () {
    HSChartDataType _chartType;
}

@property JBChartTooltipView *tooltipView;
@property JBChartTooltipTipView *tooltipTipView;
@property BOOL toolTipVisibleNow;
@property UIView *superView;

@end

@implementation HSLineChartContainer

- (id)initWithPlaceholderView:(UIView *) placeholderView chartType:(HSChartDataType)ctype {

    self = [super init];
    
    if(self) {
        
        _chartType = ctype;
        self.superView = placeholderView.superview;
        
        self.lineChartView = [[JBLineChartView alloc] initWithFrame:placeholderView.frame];
        self.lineChartView.dataSource = self;
        self.lineChartView.delegate = self;
        
        HSData *oldData = [HSDataContainer sharedInstance].dataHistory[0];
        HSData *newData = [[HSDataContainer sharedInstance].dataHistory lastObject];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *oldDate = [dateFormatter dateFromString:oldData.date];
        NSDate *newDate = [dateFormatter dateFromString:newData.date];
        [dateFormatter setDateFormat:@"LLL dd, yyyy hh:mm a"];
        
        JBLineChartFooterView *footerView = [[JBLineChartFooterView alloc] initWithFrame:CGRectMake(kJBAreaChartViewControllerChartPadding, ceil(placeholderView.bounds.size.height * 0.5) - ceil(kJBAreaChartViewControllerChartFooterHeight * 0.5), placeholderView.bounds.size.width - (kJBAreaChartViewControllerChartPadding * 2), kJBAreaChartViewControllerChartFooterHeight)];
        footerView.backgroundColor = [UIColor clearColor];
        footerView.leftLabel.text = [dateFormatter stringFromDate:oldDate];
        footerView.leftLabel.textColor = [UIColor grayColor];
        footerView.rightLabel.text = [dateFormatter stringFromDate:newDate];
        footerView.rightLabel.textColor = [UIColor grayColor];
        footerView.sectionCount = 7;
        self.lineChartView.footerView = footerView;
        
        int max = 0;
        
        for(int i = 0; i < [HSDataContainer sharedInstance].dataHistory.count; i ++) {
            
            int val =[self getValueAtIndex:i];
            if(val > max)
                max = val;
            
        }
        
        [self.lineChartView setMaximumValue:max];
        [self.lineChartView setMinimumValue:0];
        
        [placeholderView.superview addSubview:self.lineChartView];
        [placeholderView removeFromSuperview];
        
        
        [self.lineChartView reloadData];
        
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(dataUpdated)
         name:@"HSDataUpdated"
         object:nil];
    }
    
    return self;
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dataUpdated {
    [self.lineChartView reloadData];
}

#pragma mark Line Chart Stuff
- (NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView {
    return 1;
}

- (NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex {
    HSDataContainer *dataContainer = [HSDataContainer sharedInstance];
    return dataContainer.dataHistory.count;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex {
    
    return [self getValueAtIndex:(int)horizontalIndex];
    
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
    if(self.scrollView != nil) {
        self.scrollView.scrollEnabled = NO;
    }
    
    [self setTooltipVisible:YES animated:YES atTouchPoint:touchPoint];
    double val = [self getValueAtIndex:(int)horizontalIndex];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    [self.tooltipView setText:[formatter stringFromNumber:[NSNumber numberWithDouble:val]]];
    
}

- (void)didDeselectLineInLineChartView:(JBLineChartView *)lineChartView
{
    [self setTooltipVisible:NO animated:YES atTouchPoint:CGPointZero];
    self.scrollView.scrollEnabled = YES;
}

#pragma mark tool tip

//- (int) getValueAtIndexReverse:(int) index {
//    NSUInteger reverseIndex = [HSDataContainer sharedInstance].dataHistory.count - index - 1;
//    return [self getValueAtIndexReverse:reverseIndex];
//}

- (double) getValueAtIndex:(int)index {
    HSDataContainer *dataContainer = [HSDataContainer sharedInstance];
    HSData *data = [dataContainer.dataHistory objectAtIndex:index];
    
    double val = 0;
    
    switch (_chartType) {
        case STRESS_CHART:
            val = data.stress.intValue;
            break;
        case BPM_CHART:
            val = data.heartRate.intValue;
            break;
        case IBI_CHART:
            val = data.ibi.intValue;
            break;
        case GSR_CHART:
            val = data.gsr.doubleValue;
            break;
        default:
            break;
    }
    
    return val > 0? val: 0;
}

- (void)setTooltipVisible:(BOOL)tooltipVisible animated:(BOOL)animated atTouchPoint:(CGPoint)touchPoint
{
    
    self.toolTipVisibleNow = tooltipVisible;
    JBChartView *chartView = self.lineChartView;
    
    if (!chartView)
    {
        return;
    }
    
    if (!self.tooltipView)
    {
        self.tooltipView = [[JBChartTooltipView alloc] init];
        self.tooltipView.alpha = 0.0;
        self.tooltipView.backgroundColor = [UIColor colorWithRed:135/255.0 green:190/255.0 blue:115/255.0 alpha:1];
        [self.superView addSubview:self.tooltipView];
    }
    
    [self.superView bringSubviewToFront:self.tooltipView];
    
    if (!self.tooltipTipView)
    {
        self.tooltipTipView = [[JBChartTooltipTipView alloc] init];
        self.tooltipTipView.alpha = 0.0;
        [self.superView addSubview:self.tooltipTipView];
    }
    
    [self.superView bringSubviewToFront:self.tooltipTipView];
    
    dispatch_block_t adjustTooltipPosition = ^{
        CGPoint originalTouchPoint = [self.superView convertPoint:touchPoint fromView:chartView];
        CGPoint convertedTouchPoint = originalTouchPoint; // modified
        JBChartView *chartView = self.lineChartView;
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
            self.tooltipView.frame = CGRectMake(convertedTouchPoint.x - ceil(self.tooltipView.frame.size.width * 0.5), CGRectGetMinY(chartView.frame), self.tooltipView.frame.size.width, self.tooltipView.frame.size.height);
            
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
            self.tooltipTipView.frame = CGRectMake(originalTouchPoint.x - ceil(self.tooltipTipView.frame.size.width * 0.5), CGRectGetMinY(chartView.frame), self.tooltipTipView.frame.size.width, self.tooltipTipView.frame.size.height);
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

@end
