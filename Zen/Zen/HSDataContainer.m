//
//  HSStressData.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSDataContainer.h"

@interface HSDataContainer ()
@property (nonatomic, strong) NSMutableData *responseData;
@end

@implementation HSDataContainer

+ (HSDataContainer *)sharedInstance {
    
    static HSDataContainer *_sharedInstance = nil;

    if(_sharedInstance == nil) {
        _sharedInstance = [[HSDataContainer alloc] init];
        
        _sharedInstance.dataHistory = [[NSMutableArray alloc] init];
        
        //connection stuff
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
        NSDate *now = [NSDate date];
        NSDate *twoDaysAgo = [now dateByAddingTimeInterval:-2*24*60*60];
        
        _sharedInstance.responseData = [[NSMutableData alloc] init];
        
        NSMutableString *url = [[NSMutableString alloc] init];
        [url appendString:@"http://adipruthi.com/api/get_data.php?uid=poop88&start="];
        [url appendString:[dateFormatter stringFromDate:twoDaysAgo]];
        [url appendString:@"&end="];
        [url appendString:[dateFormatter stringFromDate:now]];
        NSLog(@"get request: %@", url);
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
    
    for(int i = 0; i < resA.count; i++) {
        
        NSDictionary *resO = [resA objectAtIndex:i];
        
        HSData *data = [[HSData alloc] init];
        
        for(id key in resO) {
            
            id value = [resO objectForKey:key];
            
            NSString *keyAsString = (NSString *)key;
            NSString *valueAsString = (NSString *)value;
            
            if([keyAsString isEqualToString:@"stress_score"]) {
                data.stress = valueAsString;
            } else if ([keyAsString isEqualToString:@"bpm"]) {
                data.heartRate = valueAsString;
            } else if ([keyAsString isEqualToString:@"gsr"]) {
                data.gsr = valueAsString;
            } else if ([keyAsString isEqualToString:@"date_time"]) {
                data.date = valueAsString;
            } else if ([keyAsString isEqualToString:@"ibi"]) {
                data.ibi = valueAsString;
            }
            
        }
        
        [self.dataHistory addObject:data];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HSDataUpdated" object:nil userInfo:nil];
    
}

@end
