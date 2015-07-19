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
#import "HSStress.h"

@interface HSStressData : NSObject

@property (strong, nonatomic) NSMutableArray *stressHistory;

@property (weak, nonatomic) HSStressPageViewController *stressPageViewController;
@property (weak, nonatomic) HSStressPageViewController *heartRatePageViewController;
@property (weak, nonatomic) HSStressPageViewController *gsrPageViewController;

+ (HSStressData *)sharedInstance;

@end
