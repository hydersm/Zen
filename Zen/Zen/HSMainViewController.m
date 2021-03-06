//
//  ViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSMainViewController.h"
#import "AppDelegate.h"
#import "HSAddCommentViewController.h"
#import "HSUIUtils.h"
#import "HSStressPageViewController.h"
#import "HSDataContainer.h"
#import "HSTipsData.h"

@interface HSMainViewController ()
@end

@implementation HSMainViewController

// set view property
- (void)loadView {
    self.view = [[UIView alloc] init];
}

// after view is loaded, do any non view customization
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Zen";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(pushSettingsViewToTop)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushCommentViewToTop)];
    
    //page view stuff
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    
    HSStressPageViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [[self view] addSubview:[self.pageViewController view]];
    [self.pageViewController didMoveToParentViewController:self];
    
    for (UIView *subview in self.pageViewController.view.subviews) {
        if ([subview isKindOfClass:[UIPageControl class]]) {
            UIPageControl *pageControl = (UIPageControl *)subview;
            pageControl.pageIndicatorTintColor = [UIColor grayColor];
            pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
            pageControl.backgroundColor = [UIColor whiteColor];
        }
    }
    
    //table view stuff
    
    self.tableViewController = [[HSTipsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self addChildViewController:self.tableViewController];
    [self.view addSubview:self.tableViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

//view has resized, add subviews here
- (void)viewWillAppear:(BOOL)animated {
    
    //page view resizing
    float yOffset = self.navigationController.navigationBar.frame.size.height;
    float padding = 10;
    
    [[self.pageViewController view] setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y + yOffset + padding, self.view.bounds.size.width, self.view.bounds.size.height/2.0 - (yOffset + padding))];
    
    //table view resizing
    CGRect tableRect = CGRectMake(self.view.bounds.origin.x, self.pageViewController.view.frame.origin.y + self.pageViewController.view.frame.size.height + padding, self.view.bounds.size.width, self.view.bounds.size.height - (self.pageViewController.view.frame.origin.y + self.pageViewController.view.frame.size.height + padding));
    
    [self.tableViewController.view setFrame:tableRect];
    
}

- (void)pushCommentViewToTop {
    
    HSAddCommentViewController *addCommentViewController = [[HSAddCommentViewController alloc] init];
    
    [HSUIUtils pushViewController:addCommentViewController ToNavigationController:self.navigationController withButtomToTopAnimation:YES];
    
}

- (void)pushSettingsViewToTop {
    
    HSSettingsViewController *settingsViewController = [[HSSettingsViewController alloc] init];
    
    [HSUIUtils pushViewController:settingsViewController ToNavigationController:self.navigationController withButtomToTopAnimation:YES];
    
}

//page view data source methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(HSStressPageViewController *)viewController index];
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(HSStressPageViewController *)viewController index];
    index++;
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

- (HSStressPageViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    HSStressPageViewController *childViewController;
    HSDataContainer *stressData = [HSDataContainer sharedInstance];
    HSData *lastStress = [stressData.dataHistory lastObject];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *newDate = [dateFormatter dateFromString:lastStress.date];
    [dateFormatter setDateFormat:@"LLL dd, yyyy hh:mm a"];
    
    if(index == 0) {
        childViewController = [[HSStressPageViewController alloc] initWitLabel:@"Stress Score" nibName:@"HSStressPageViewController" bundle:nil];
        if(lastStress.stress != nil) {
            childViewController.numberString = lastStress.stress;
            childViewController.numberSecondaryLabelString = [dateFormatter stringFromDate:newDate];
        }
    } else if (index == 1) {
        childViewController = [[HSStressPageViewController alloc] initWitLabel:@"Heart Rate" nibName:@"HSStressPageViewController" bundle:nil];
        if(lastStress.heartRate != nil) {
            childViewController.numberString = lastStress.heartRate;
            childViewController.numberSecondaryLabelString = [dateFormatter stringFromDate:newDate];
        }
    } else if (index == 2) {
        childViewController = [[HSStressPageViewController alloc] initWitLabel:@"Galvanic Skin Response" nibName:@"HSStressPageViewController" bundle:nil];
        if(lastStress.gsr != nil) {
            childViewController.numberString = lastStress.gsr;
            childViewController.numberSecondaryLabelString = [dateFormatter stringFromDate:newDate];
        }
    } else {
        
        childViewController = nil;
        
    }
    
    childViewController.index = index;
    childViewController.navController = self.navigationController;
    
    return childViewController;
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
