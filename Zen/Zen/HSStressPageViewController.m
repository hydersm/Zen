//
//  HSStressPageViewController.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSStressPageViewController.h"

@interface HSStressPageViewController ()
@end

@implementation HSStressPageViewController

- (id)initWitLabel:(NSString *)label nibName:(NSString *)nibName bundle:(NSBundle *) bundle {
    
    self = [super initWithNibName:nibName bundle:bundle];
    
    if(self) {
        
        self.numberLabelString = label;
        self.numberSecondaryLabelString = @"";
        self.numberString = @"";
        
    }
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(dataUpdated)
     name:@"HSDataUpdated"
     object:nil];
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberView.text = self.numberString;
    self.numberLabelView.text = self.numberLabelString;
    self.numberSecondaryLabelView.text = self.numberSecondaryLabelString;
    
    self.numberView.adjustsFontSizeToFitWidth = YES;
    self.numberView.minimumScaleFactor = 0.5;
    self.numberLabelView.adjustsFontSizeToFitWidth = YES;
    self.numberLabelView.minimumScaleFactor = 0.5;
    self.numberSecondaryLabelView.adjustsFontSizeToFitWidth = YES;
    self.numberSecondaryLabelView.minimumScaleFactor = 0.5;
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    
}


//setters
- (void)setNumberString:(NSString *)numberString {
    _numberString = numberString;
    _numberView.text = self.numberString;
}

- (void)setNumberLabelString:(NSString *)numberLabelString {
    _numberLabelString = numberLabelString;
    _numberLabelView.text = self.numberLabelString;
}

- (void)setNumberSecondaryLabelString:(NSString *)numberSecondaryLabelString {
    _numberSecondaryLabelString = numberSecondaryLabelString;
    _numberSecondaryLabelView.text = self.numberSecondaryLabelString;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    
    HSGraphViewController *graphViewController = [[HSGraphViewController alloc] init];
    
    [HSUIUtils pushViewController:graphViewController ToNavigationController:self.navController withButtomToTopAnimation:YES];
}

- (void)dataUpdated {
    HSData *lastData = [[HSDataContainer sharedInstance].dataHistory lastObject];
    if([self.numberLabelString isEqualToString:@"Stress Score"]) {
        self.numberString = lastData.stress;
    } else if ([self.numberLabelString isEqualToString:@"Heart Rate"]) {
        self.numberString = lastData.heartRate;
    } else if ([self.numberLabelString isEqualToString:@"Galvanic Skin Response"]) {
        self.numberString = lastData.gsr;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
