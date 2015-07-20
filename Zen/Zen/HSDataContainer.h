//
//  HSStressData.h
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HSData.h"
@class HSStressPageViewController;

@interface HSDataContainer : NSObject

@property (strong, nonatomic) NSMutableArray *dataHistory;

+ (HSDataContainer *)sharedInstance;

@end
