//
//  HSStressData.h
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HSStressPageViewController.h"

@interface HSStressData : NSObject

@property (strong, nonatomic) NSString *stress;
@property (strong, nonatomic) NSString *heartRate;
@property (strong, nonatomic) NSString *gsr;

@property (weak, nonatomic) HSStressPageViewController *stressPageViewController;
@property (weak, nonatomic) HSStressPageViewController *heartRatePageViewController;
@property (weak, nonatomic) HSStressPageViewController *gsrPageViewController;

+ (HSStressData *)sharedInstance;

@end
