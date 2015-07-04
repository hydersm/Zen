//
//  HSStressPageViewController.h
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSStressPageViewController : UIViewController

@property (assign, nonatomic) NSInteger index;

@property (assign, nonatomic) NSString *numberString;
@property (assign, nonatomic) NSString *numberLabelString;
@property (assign, nonatomic) NSString *numberSecondaryLabelString;

@property (strong, nonatomic) IBOutlet UILabel *numberView;
@property (strong, nonatomic) IBOutlet UILabel *numberLabelView;
@property (strong, nonatomic) IBOutlet UILabel *numberSecondaryLabelView;

- (id)initWithNumber:(NSNumber *)number label:(NSString *)label secondaryLabel:(NSString *)secondaryLabel nibName:(NSString *)nibName bundle:(NSBundle *) bundle;

@end
