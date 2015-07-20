//
//  HSAddCommentViewController.h
//  Zen
//
//  Created by Hyder SM on 2015-07-03.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSLineChartContainer.h"

@interface HSAddCommentViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *question1ButtonCollection;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *question2ButtonCollection;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UIView *stressLineChartPlaceholder;

- (IBAction)question1ButtonPressed:(id)sender;
- (IBAction)question2ButtonPressed:(id)sender;
- (IBAction)submitButtonPressed:(id)sender;

@end
