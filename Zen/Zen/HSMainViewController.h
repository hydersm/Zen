//
//  ViewController.h
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSTipsTableViewController.h"
#import "HSSettingsViewController.h"

@interface HSMainViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) HSTipsTableViewController *tableViewController;

@end
