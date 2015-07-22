//
//  HSTips.h
//  Zen
//
//  Created by Hyder SM on 2015-07-21.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSTip : NSObject

@property (strong, nonatomic) NSString *tipString;
@property (strong, nonatomic) NSDate *dateCreated;

- (id)initWithTip:(NSString *)tipString DateCreated:(NSDate *)dateCreated;

@end
