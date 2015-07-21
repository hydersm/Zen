//
//  HSTipsTableViewCell.m
//  Zen
//
//  Created by Hyder SM on 2015-07-04.
//  Copyright (c) 2015 Hyder. All rights reserved.
//

#import "HSTipsTableViewCell.h"

@implementation HSTipsTableViewCell

- (void) setTip:(NSString *)tip {
    
    self.tipLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.tipLabel.text = [tip stringByAppendingString:@" \n \n \n \n"];
    self.tipLabel.numberOfLines = 4;
    self.timeLabel.text = @"Just now";
    
}

- (void)awakeFromNib {
    self.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    self.containerView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    self.containerView.layer.borderColor = [UIColor colorWithRed:177/255.0 green:177/255.0 blue:177/255.0 alpha:1.0].CGColor;
//    self.containerView.layer.borderWidth = 1;
    self.containerView.layer.cornerRadius = 5.0;
    self.containerView.layer.masksToBounds = YES;
    
    //buttons
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
