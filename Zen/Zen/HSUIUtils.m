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
    
    [navigationController pushViewController:viewController animated:NO];
    
    if (flag) {
        
        CGRect oldFrame = navigationController.view.frame;
        [navigationController.view setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y + oldFrame.size.height, oldFrame.size.width, oldFrame.size.height)];
        
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionOverrideInheritedOptions &UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [navigationController.view setFrame:oldFrame];
                         } completion:NULL];
        
    }
    
    
}

+ (void)popViewControllerFromNavigationController:(UINavigationController *) navigationController withTopToBottomAnimation:(BOOL)flag {
    
    CGRect oldFrame = navigationController.view.frame;
    
    if (flag) {
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionOverrideInheritedOptions &UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [navigationController.view setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y + oldFrame.size.height, oldFrame.size.width, oldFrame.size.height)];
                         }
                         completion: ^(BOOL finished){
                             if(finished) {
                                 [navigationController popViewControllerAnimated:NO];
                                 [navigationController.view setFrame:oldFrame];
                             }
                         }];
        
    }
    
}

@end
