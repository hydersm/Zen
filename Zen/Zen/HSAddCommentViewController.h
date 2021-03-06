//
//  HSAddCommentViewController.h
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSLineChartContainer.h"
#import "HSTipsData.h"
#import "HSDataContainer.h"

@interface HSAddCommentViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *question1ButtonCollection;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *question2ButtonCollection;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UIView *stressLineChartPlaceholder;
@property (strong, nonatomic) IBOutlet UISlider *stressSlider;

- (IBAction)question1ButtonPressed:(id)sender;
- (IBAction)question2ButtonPressed:(id)sender;
- (IBAction)submitButtonPressed:(id)sender;

@end
