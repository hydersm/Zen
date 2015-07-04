//
//  HSUIUtils.m
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSUIUtils.h"

@implementation HSUIUtils

+ (void)pushViewController:(UIViewController *)viewController ToNavigationController:(UINavigationController *) navigationController withButtomToTopAnimation:(BOOL)flag {
    
    UIViewController *tempViewController = [[UIViewController alloc] init];
    tempViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:nil action:nil];
    tempViewController.view = [[UIView alloc] init];
    tempViewController.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *tempNavigationController = [[UINavigationController alloc] initWithRootViewController:tempViewController];
    tempNavigationController.navigationBar.tintColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
    
    [navigationController.view addSubview:tempNavigationController.view];
    
    if (flag) {
        
        CGRect oldFrame = tempNavigationController.view.frame;
        [tempNavigationController.view setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y + oldFrame.size.height, oldFrame.size.width, oldFrame.size.height)];
        
        [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            [tempNavigationController.view setFrame:oldFrame];
            
        } completion:^(BOOL finished) {
            
            if(finished) {
                [navigationController pushViewController:viewController animated:NO];
                [tempNavigationController.view removeFromSuperview];
            }
            
        }];
        
        
    }
    
    
}

+ (void)popViewControllerFromNavigationController:(UINavigationController *) navigationController withTopToBottomAnimation:(BOOL)flag {
    
    UIViewController *tempViewController = [[UIViewController alloc] init];
    tempViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:nil action:nil];
    tempViewController.view = [[UIView alloc] init];
    tempViewController.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *tempNavigationController = [[UINavigationController alloc] initWithRootViewController:tempViewController];
    tempNavigationController.navigationBar.tintColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
    
    [navigationController.view addSubview:tempNavigationController.view];
    
    [navigationController popViewControllerAnimated:NO];
    
    if (flag) {
        
        CGRect oldFrame = tempNavigationController.view.frame;
        
        [UIView animateWithDuration:0.75
                              delay:0
             usingSpringWithDamping:1.0
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [tempNavigationController.view setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y + oldFrame.size.height, oldFrame.size.width, oldFrame.size.height)];
                         }
                         completion:^(BOOL finished){
                             if(finished) {
                                 
                                 [tempNavigationController.view removeFromSuperview];
                             }
                         }];
        
    }
    
}

@end
