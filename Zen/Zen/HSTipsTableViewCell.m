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
    
    self.tipLabel.lineBreakMode = NSLineBreakByClipping;
    self.tipLabel.text = [tip stringByAppendingString:@"\n\n\n\n"];
    self.timeLabel.text = @"Just now";
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
