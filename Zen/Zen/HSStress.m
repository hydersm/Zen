//
//  HSStress.m
//  Zen
//
//  Created by Hyder SM on 2015-07-19.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSStress.h"

@implementation HSStress

- (id) init {
    
    self = [super init];
    
    if(self) {
        self.stress = [[NSString alloc] init];
        self.heartRate = [[NSString alloc] init];
        self.gsr = [[NSString alloc] init];
    }
    
    return self;
}

@end
