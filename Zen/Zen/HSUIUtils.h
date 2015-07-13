//
//  HSUIUtils.h
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HSUIUtils : NSObject

+ (void)pushViewController:(UIViewController *)viewController ToNavigationController:(UINavigationController *) navigationController withButtomToTopAnimation:(BOOL)flag;
+ (void)popViewControllerFromNavigationController:(UINavigationController *) navigationController withTopToBottomAnimation:(BOOL)flag;
+ (void)setUpButton:(UIButton *) button;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
