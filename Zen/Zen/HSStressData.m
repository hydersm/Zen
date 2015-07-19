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
        
        _sharedInstance.stressHistory = [[NSMutableArray alloc] init];
        
        //connection stuff
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMddhhmmss"];
        NSDate *now = [NSDate date];
        NSDate *twoDaysAgo = [now dateByAddingTimeInterval:-2*24*60*60];
        
        _sharedInstance.responseData = [[NSMutableData alloc] init];
        
        NSMutableString *url = [[NSMutableString alloc] init];
        [url appendString:@"http://adipruthi.com/api/get_data.php?uid=hyder6&start="];
        [url appendString:[dateFormatter stringFromDate:twoDaysAgo]];
        [url appendString:@"&end="];
        [url appendString:[dateFormatter stringFromDate:now]];
        NSURLRequest *request = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:url]];
        
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
    NSArray *resA = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    // show all values
    for(int i = 0; i < resA.count; i++) {
        
        NSDictionary *resO = [resA objectAtIndex:i];
        
        HSStress *stress = [[HSStress alloc] init];
        
        for(id key in resO) {
            
            id value = [resO objectForKey:key];
            
            NSString *keyAsString = (NSString *)key;
            NSString *valueAsString = (NSString *)value;
            
            if([keyAsString isEqualToString:@"stress_score"]) {
                stress.stress = valueAsString;
            } else if ([keyAsString isEqualToString:@"bpm"]) {
                stress.heartRate = valueAsString;
            } else if ([keyAsString isEqualToString:@"gsr"]) {
                stress.gsr = valueAsString;
            } else if ([keyAsString isEqualToString:@"date_time"]) {
                stress.date = valueAsString;
            }
            
        }
        
        [self.stressHistory addObject:stress];
    }
    
    HSStress *lastStress = [self.stressHistory lastObject];
    if(self.stressPageViewController != nil)
        self.stressPageViewController.numberString = lastStress.stress;
    
    if(self.heartRatePageViewController != nil)
        self.heartRatePageViewController.numberString = lastStress.heartRate;
    
    if(self.gsrPageViewController != nil)
        self.gsrPageViewController.numberString = lastStress.gsr;
    
    NSLog(@"Stop");
}

@end
