//
//  BadgeCountTableCell.m
//  Created by Mark Jones on 9/24/09.
//  Copyright 2009 Geordie Enterprises LLC. All rights reserved.
//

#import "BadgeCountTableCell.h"
#import "UITableViewCell+CustomNib.h"

@implementation BadgeCountTableCell


@synthesize icon,titleText,level,mainText,countText,countBadge;

- (id) initWithLevel:(BCImageLevel)level 
            andText:(NSString*)displayText
            andCount:(NSUInteger)count
            andIcon:(UIImage*)iconImage 
            andReuseIdentifier:(NSString*)reuseIdentifier  {
  
  if(self = [super initWithNibName:@"BadgeCountTableCell" reuseIdentifier:reuseIdentifier]) {

    self.titleText = displayText;
    
//    if (iconImage != nil) {
//      self.icon.image = iconImage;
//    }
    
    if (count > 0) {
      UIImage* baseImage = [UIImage imageNamed:MED_IMAGE];
      NSString* countTextValue = [NSString stringWithFormat:@"%d",count];    
      CGSize countTextSize = [countTextValue sizeWithFont:[UIFont fontWithName:@"Helvetica" size:12]];
      UIImage* badge = [baseImage stretchableImageWithLeftCapWidth:12 topCapHeight:0];
      [self.countBadge setImage:badge];
      self.countText.text = countTextValue;
      CGRect badgeFrame = CGRectMake(self.countBadge.frame.origin.x,self.countBadge.frame.origin.y, countTextSize.width + 14, badge.size.height);
      [self.countBadge setFrame:badgeFrame];
      [self.countText setFrame:badgeFrame];      
    }
    else {
      self.countText.text = @"";
    }

    
    self.mainText.text = displayText;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;    
  }
  return self;  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    
    [super dealloc];
}


@end
