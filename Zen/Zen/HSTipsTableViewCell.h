//
//  HSTipsTableViewCell.h
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "HSDataContainer.h"

@interface HSTipsTableViewCell : SWTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@property (assign, nonatomic) NSString *tip;

@end
