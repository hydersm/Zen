//
//  LineChartContainer.h
//  Zen
//
//  Created by Hyder SM on 2015-07-19.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JBLineChartView.h"
#import "JBChartTooltipView.h"
#import "JBConstants.h"
#import "JBChartTooltipTipView.h"
#import "JBLineChartFooterView.h"
#import "HSDataContainer.h"

typedef NS_ENUM(NSUInteger, HSChartDataType) {
    STRESS_CHART,
    BPM_CHART,
    IBI_CHART,
    GSR_CHART
};

@interface HSLineChartContainer : NSObject <JBLineChartViewDataSource, JBLineChartViewDelegate> {
    
}

@property (strong, nonatomic) JBLineChartView *lineChartView;
@property (weak, nonatomic) UIScrollView *scrollView;

- (id)initWithPlaceholderView:(UIView *) placeholderView chartType:(HSChartDataType)ctype;

@end
