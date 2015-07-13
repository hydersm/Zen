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
    tempNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:135/255.0 green:190/255.0 blue:115/255.0 alpha:1.0];
    tempNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
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
    tempNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:135/255.0 green:190/255.0 blue:115/255.0 alpha:1.0];
    tempNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    
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

+ (void)setUpButton:(UIButton *) button {
    
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor colorWithRed:177/255.0 green:177/255.0 blue:177/255.0 alpha:1.0].CGColor;
    button.layer.cornerRadius = 5.0;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:135/255.0 green:190/255.0 blue:115/255.0 alpha:1.0]] forState:UIControlStateSelected];
    
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
