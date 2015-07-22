//
//  HSTipsData.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSTipsData.h"

@interface HSTipsData()

@property (strong, nonatomic) NSDictionary *tipsDictionary;
@property (strong, nonatomic) NSDictionary *tree;

@end

@implementation HSTipsData

+ (HSTipsData *)sharedInstance {
    
    static HSTipsData *_sharedInstance = nil;
    
    if(_sharedInstance == nil) {
        _sharedInstance = [[HSTipsData alloc] init];
        
        _sharedInstance.tipsDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                          @"Do deep breathing exercises for 10 minutes. Close your eyes, sit up straight, relax your shoulders, and focus on breathing. Breathe slowly through your nose, making sure you are using your lower abdomen. Hold your breath for a moment before you exhale through your mouth.", @"breath",
                                          @"Listen to gentle, relaxing music that you enjoy. This can be Baroque music, nature sounds like rain or waterfalls, or your favourite instrumental sountrack. A quick search on YouTube will give you hours of calming background music.", @"music",
                                          @"Do something that makes you laugh. Have a chat with your funniest friend, watch a clip of your favourite sitcom, or browse through the comedy section of Youtube.", @"laugh",
                                          @"Get some exercise. Go for a run, hit the gym, or anything else that gets you up and moving. If it\'s more convenient right now, do a few minutes of push ups and sit ups to get the sweat going.", @"exercise",
                                          @"Stretch out the tension in your muscles. Focus on your shoulders, back, and neck.", @"stretch",
                                          @"Have a friend give you a gentle back massage.", @"massage",
                                          @"Get out the yoga mat and work on your downward dog. Focus on breathing and stretching your muscles. Namaste!", @"yoga",
                                          @"Meditate in a calm and quiet place. Get comfortable (sitting, lying down, or ever walking) and focus on deep breathing. Scan your body and focus on the sensations you\'re feeling in each part of your body.", @"meditate",
                                          @"Visualize a peaceful scene in your mind. Think about something that makes you happy, like a vacation you\'ve had or a favourite childhood memory. Focus on the vision, sounds, and what you were feeling at the time.", @"visualization",
                                          @"Attend a stress management workshop hosted by the University of Waterloo\'s Counselling Services. You\'ll be able to speak to a counsellor and learn techniques on things you can do to handle stress. Visit https://uwaterloo.ca/counselling-services/services/workshops for more information.", @"workshop",
                                          @"Visit a counsellor. They will help you develop a plan to handle your stress in a healthy, sustainable way. Book an appointment by dropping into the Counselling Services office in Needles Hall.", @"counsellor",
                                          @"Have a healthy snack. Drink a big glass of water and a eat healthy snack like fruit or nuts.", @"eat",
                                          @"Make sure you\'re getting enough sleep. Take a nap now, or make sure to go to bed a little earlier tonight.", @"sleep",
                                          @"Talk to a friend about the things that are causing you to feel stressed.", @"friend",
                                          @"Stop what you\'re doing and take a 10 minute break doing something you enjoy. Go for a walk, read a book, or listen to music.", @"break",
                                          @"Go outside and get some fresh air. Take a quick stroll, or sit down and focus on deep breathing.", @"air",
                                          nil];
        
        _sharedInstance.tree = @{
                                 @1:@{
                                         @"office":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"air", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"visualization"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"visualization"],
                                                 @"eating":@[@"air", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"air", @"meditate"],
                                                 @"walking":@[@"breath", @"music", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"eat", @"exercise"]
                                                 },
                                         @"gym":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"air", @"break"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"break"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"break"],
                                                 @"eating":@[@"air", @"laugh", @"break"],
                                                 @"studying":@[@"breath", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"break"],
                                                 @"sleeping":@[@"breath", @"break", @"music"],
                                                 @"gaming":@[@"break", @"air", @"meditate"],
                                                 @"walking":@[@"breath", @"music", @"break"],
                                                 @"hanging out":@[@"meditate", @"eat", @"break"]
                                                 },
                                         @"home":@{
                                                 @"working":@[@"exercise", @"sleep", @"break"],
                                                 @"reading":@[@"music", @"air", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"visualization"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"visualization"],
                                                 @"eating":@[@"air", @"laugh", @"friend"],
                                                 @"studying":@[@"sleep", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"massage"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"exercise", @"meditate"],
                                                 @"walking":@[@"breath", @"music", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"eat", @"exercise"]
                                                 },
                                         @"outside":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"exercise", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"visualization"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"visualization"],
                                                 @"eating":@[@"breath", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"yoga", @"meditate"],
                                                 @"walking":@[@"breath", @"music", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"eat", @"exercise"]
                                                 },
                                         @"car":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"visualization", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"visualization"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"visualization"],
                                                 @"eating":@[@"breath", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"stretch", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"friend", @"meditate"],
                                                 @"walking":@[@"breath", @"music", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"eat", @"music"]
                                                 }
                                        },
                                 @2:@{
                                         @"office":@{
                                                 @"working":@[@"breath", @"friend", @"break"],
                                                 @"reading":@[@"music", @"air", @"friend"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop"],
                                                 @"eating":@[@"air", @"laugh", @"friend"],
                                                 @"studying":@[@"friend", @"exercise", @"break"],
                                                 @"working out":@[@"friend", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"friend", @"meditate"],
                                                 @"walking":@[@"breath", @"friend", @"laugh"],
                                                 @"hanging out":@[@"workshop", @"eat", @"exercise"]
                                                 },
                                         @"gym":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"air", @"break"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"break"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"break"],
                                                 @"eating":@[@"air", @"laugh", @"break"],
                                                 @"studying":@[@"breath", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"break"],
                                                 @"sleeping":@[@"breath", @"break", @"music"],
                                                 @"gaming":@[@"break", @"air", @"meditate"],
                                                 @"walking":@[@"friend", @"music", @"break"],
                                                 @"hanging out":@[@"workshop", @"eat", @"break"]
                                                 },
                                         @"home":@{
                                                 @"working":@[@"exercise", @"sleep", @"friend"],
                                                 @"reading":@[@"friend", @"air", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop"],
                                                 @"eating":@[@"air", @"laugh", @"friend"],
                                                 @"studying":@[@"sleep", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"massage"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"workshop", @"exercise", @"meditate"],
                                                 @"walking":@[@"breath", @"friend", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"friend", @"workshop"]
                                                 },
                                         @"outside":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"exercise", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop"],
                                                 @"eating":@[@"breath", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"workshop", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"yoga", @"meditate"],
                                                 @"walking":@[@"breath", @"workshop", @"laugh"],
                                                 @"hanging out":@[@"friend", @"workshop", @"exercise"]
                                                 },
                                         @"car":@{
                                                 @"working":@[@"friend", @"stretch", @"break"],
                                                 @"reading":@[@"friend", @"visualization", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop"],
                                                 @"eating":@[@"breath", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"friend", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"workshop", @"friend"],
                                                 @"walking":@[@"breath", @"friend", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"eat", @"workshop"]
                                                 }
                                         },
                                 @3:@{
                                         @"office":@{
                                                 @"working":@[@"breath", @"friend", @"break", @"counsellor"],
                                                 @"reading":@[@"music", @"air", @"friend", @"counsellor"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop", @"counsellor"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop", @"counsellor"],
                                                 @"eating":@[@"air", @"laugh", @"friend", @"counsellor"],
                                                 @"studying":@[@"friend", @"exercise", @"break", @"counsellor"],
                                                 @"working out":@[@"friend", @"music", @"eat", @"counsellor"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music", @"counsellor"],
                                                 @"gaming":@[@"break", @"friend", @"meditate", @"counsellor"],
                                                 @"walking":@[@"breath", @"friend", @"laugh", @"counsellor"],
                                                 @"hanging out":@[@"workshop", @"eat", @"exercise", @"counsellor"]
                                                 },
                                         @"gym":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"air", @"break"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"break"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"break"],
                                                 @"eating":@[@"air", @"laugh", @"break"],
                                                 @"studying":@[@"breath", @"exercise", @"break"],
                                                 @"working out":@[@"breath", @"music", @"break"],
                                                 @"sleeping":@[@"breath", @"break", @"music"],
                                                 @"gaming":@[@"break", @"air", @"meditate"],
                                                 @"walking":@[@"friend", @"music", @"break"],
                                                 @"hanging out":@[@"workshop", @"eat", @"break"]
                                                 },
                                         @"home":@{
                                                 @"working":@[@"exercise", @"sleep", @"friend", @"counsellor"],
                                                 @"reading":@[@"friend", @"air", @"stretch", @"counsellor"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop", @"counsellor"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop", @"counsellor"],
                                                 @"eating":@[@"air", @"laugh", @"friend", @"counsellor"],
                                                 @"studying":@[@"sleep", @"exercise", @"break", @"counsellor"],
                                                 @"working out":@[@"breath", @"music", @"massage", @"counsellor"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music", @"counsellor"],
                                                 @"gaming":@[@"workshop", @"exercise", @"meditate", @"counsellor"],
                                                 @"walking":@[@"breath", @"friend", @"laugh", @"counsellor"],
                                                 @"hanging out":@[@"meditate", @"friend", @"workshop", @"counsellor"]
                                                 },
                                         @"outside":@{
                                                 @"working":@[@"breath", @"stretch", @"break"],
                                                 @"reading":@[@"music", @"exercise", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop"],
                                                 @"eating":@[@"breath", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"workshop", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"yoga", @"meditate"],
                                                 @"walking":@[@"breath", @"workshop", @"laugh"],
                                                 @"hanging out":@[@"friend", @"workshop", @"exercise"]
                                                 },
                                         @"car":@{
                                                 @"working":@[@"friend", @"stretch", @"break"],
                                                 @"reading":@[@"friend", @"visualization", @"stretch"],
                                                 @"in a lecture":@[@"breath", @"stretch", @"workshop"],
                                                 @"in a meeting":@[@"breath", @"stretch", @"workshop"],
                                                 @"eating":@[@"breath", @"laugh", @"friend"],
                                                 @"studying":@[@"breath", @"friend", @"break"],
                                                 @"working out":@[@"breath", @"music", @"eat"],
                                                 @"sleeping":@[@"breath", @"stretch", @"music"],
                                                 @"gaming":@[@"break", @"workshop", @"friend"],
                                                 @"walking":@[@"breath", @"friend", @"laugh"],
                                                 @"hanging out":@[@"meditate", @"eat", @"workshop"]
                                                 }
                                         }
                                 };
        
        [_sharedInstance loadData];
    }
    
    return _sharedInstance;
    
}

- (void)saveData {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedTips = [NSKeyedArchiver archivedDataWithRootObject:self.tips];
    [userDefaults setObject:encodedTips forKey:@"HSTipsArray"];
    [userDefaults setInteger:self.tipsCompleted forKey:@"HSTipsCompleted"];
    [userDefaults setInteger:self.tipsIgnored forKey:@"HSTipsIgnored"];
    [userDefaults synchronize];
}

- (void)loadData {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedTips = [userDefaults objectForKey:@"HSTipsArray"];
    self.tips = [NSKeyedUnarchiver unarchiveObjectWithData:encodedTips];
    self.tipsCompleted = (int)[userDefaults integerForKey:@"HSTipsCompleted"];
    self.tipsIgnored = (int)[userDefaults integerForKey:@"HSTipsIgnored"];
    
    if(self.tips == nil) {
        self.tips = [[NSMutableArray alloc] init];
    }
    
}

- (void)generateTipsWithActualStress:(int)actualStress userStress:(double)userStress location:(NSString *)location activity:(NSString *)activity {
    
    NSNumber *stress = @(ceil(fmin(fmax((actualStress + userStress)/2.0, 0), 3)));
    if([location isEqualToString:@"classroom"] || [location isEqualToString:@"lab"] || [location isEqualToString:@"restaurant"] || [location isEqualToString:@"coffeshop"] || [location isEqualToString:@"library"]) {
        location = @"office";
    }
    
    NSArray *tipsToAdd = ((self.tree[stress])[location])[activity];
    
    for (NSString *tipKey in tipsToAdd) {
        NSString *tip = self.tipsDictionary[tipKey];
        HSTip *tipO = [[HSTip alloc] initWithTip:tip DateCreated:[NSDate date]];
        if(![self.tips containsObject:tipO])
            [self.tips addObject:tipO];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HSTipsUpdated" object:nil userInfo:nil];
    
}

@end
