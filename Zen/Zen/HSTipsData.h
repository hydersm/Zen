//
//  HSTipsData.h
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSTipsData : NSObject

@property (strong, nonatomic) NSMutableArray *tips;

+ (HSTipsData *)sharedInstance;

@end
