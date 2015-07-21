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

- (void)generateTipsWithActualStress:(int)actualStress userStress:(double)userStress location:(NSString *)location activity:(NSString *)activity;
- (void)saveData;
- (void)loadData;

@end
