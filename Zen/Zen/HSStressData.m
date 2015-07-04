//
//  HSStressData.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSStressData.h"

@implementation HSStressData

+ (HSStressData *)sharedInstance {
    
    static HSStressData *_sharedInstance = nil;
    
    if(_sharedInstance == nil) {
        _sharedInstance = [[HSStressData alloc] init];
        
    }
    
    return _sharedInstance;
    
}

@end
