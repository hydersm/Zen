//
//  HSTips.m
//  Zen
//
//  Created by Hyder SM on 2015-07-21.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSTip.h"

@implementation HSTip

- (id)initWithTip:(NSString *)tipString DateCreated:(NSDate *)dateCreated {
    self = [super init];
    if(self) {
        self.tipString = tipString;
        self.dateCreated = dateCreated;
    }
    return self;
}

- (NSUInteger)hash {
    return [self.tipString hash];
}

- (BOOL)isEqual:(id)object {
    HSTip *tip = object;
    BOOL equal =[self.tipString isEqualToString:tip.tipString];
    return equal;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.tipString forKey:@"HSTipsString"];
    [encoder encodeObject:self.dateCreated forKey:@"HSTipsDateCreated"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.tipString = [decoder decodeObjectForKey:@"HSTipsString"];
        self.dateCreated = [decoder decodeObjectForKey:@"HSTipsDateCreated"];
    }
    return self;
}

@end
