//
//  HSStressData.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSStressData.h"

@interface HSStressData ()
@property (nonatomic, strong) NSMutableData *responseData;
@end

@implementation HSStressData

+ (HSStressData *)sharedInstance {
    
    static HSStressData *_sharedInstance = nil;

    if(_sharedInstance == nil) {
        _sharedInstance = [[HSStressData alloc] init];
        
        _sharedInstance.stress = [[NSString alloc] init];
        _sharedInstance.heartRate = [[NSString alloc] init];
        _sharedInstance.gsr = [[NSString alloc] init];
        
        //connection stuff
        _sharedInstance.responseData = [[NSMutableData alloc] init];
        NSURLRequest *request = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:@"http://adipruthi.com/api/get_data.php?uid=tommy&start=20000101000000&end=20300101000000"]];
        [[NSURLConnection alloc] initWithRequest:request delegate:_sharedInstance];
        
    }
    
    return _sharedInstance;
    
}

//connection
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    //    NSLog(@"Succeeded! Received %d bytes of data",[self.responseData length]);
    NSLog([[NSString alloc] initWithData:self.responseData encoding:NSASCIIStringEncoding]);
    
    // convert to JSON
    NSError *myError = nil;
    NSArray *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    // show all values
    NSDictionary *first = res.lastObject;
    for(id key in first) {
        
        id value = [first objectForKey:key];
        
        NSString *keyAsString = (NSString *)key;
        NSString *valueAsString = (NSString *)value;
        
        if([keyAsString isEqualToString:@"stress_score"]) {
            self.stress = valueAsString;
            if(self.stressPageViewController != nil) {
                self.stressPageViewController.numberString = self.stress;
            }
        } else if ([keyAsString isEqualToString:@"bpm"]) {
            self.heartRate = valueAsString;
            if(self.heartRatePageViewController != nil) {
                self.heartRatePageViewController.numberString = self.heartRate;
            }
        } else if ([keyAsString isEqualToString:@"gsr"]) {
            self.gsr = valueAsString;
            if(self.gsrPageViewController != nil) {
                self.gsrPageViewController.numberString = self.gsr;
            }
        }
        
        
    }
    
}

@end
