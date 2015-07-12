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
    self.containerView.layer.borderColor = [UIColor grayColor].CGColor;
    self.containerView.layer.borderWidth = 1.5;
    self.containerView.layer.cornerRadius = 5.0;
    self.containerView.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
