//
//  HSTipsData.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSTipsData.h"

@implementation HSTipsData

+ (HSTipsData *)sharedInstance {
    
    static HSTipsData *_sharedInstance = nil;
    
    if(_sharedInstance == nil) {
        _sharedInstance = [[HSTipsData alloc] init];
        _sharedInstance.tips = [[NSMutableArray alloc] init];
    }
    
    return _sharedInstance;
    
}

@end
