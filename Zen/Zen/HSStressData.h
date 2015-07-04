//
//  HSStressData.h
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSStressData : NSObject

@property (assign, nonatomic) NSNumber *stress;
@property (assign, nonatomic) NSNumber *heartRateContribution;
@property (assign, nonatomic) NSNumber *gsrContribution;

+ (HSStressData *)sharedInstance;

@end
