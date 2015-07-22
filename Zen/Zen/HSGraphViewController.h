//
//  HSGraphViewController.h
//  Zen
//
//  Created by Hyder SM on 2015-07-19.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSUIUtils.h"
#import "HSLineChartContainer.h"
#import "HSTipsData.h"

@interface HSGraphViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *stressLineChartPlaceholder;
@property (strong, nonatomic) IBOutlet UIView *hrLineChartPlaceholder;
@property (strong, nonatomic) IBOutlet UIView *ibiLineChartPlaceholder;
@property (strong, nonatomic) IBOutlet UIView *gsrLineChartPlaceholder;
@property (strong, nonatomic) IBOutlet UILabel *tipsIgnoredLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipsCompletedLabel;

@property (strong, nonatomic) HSLineChartContainer *stressLineChartContainer;
@property (strong) HSLineChartContainer *hrLineChartContainer;
@property (strong) HSLineChartContainer *ibiLineChartContainer;
@property (strong) HSLineChartContainer *gsrLineChartContainer;

@end
