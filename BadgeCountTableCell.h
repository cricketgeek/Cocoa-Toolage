//
//  BadgeCountTableCell.h
//  Created by Mark Jones on 9/24/09.
//  Copyright 2009 Geordie Enterprises LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LOW_IMAGE @"blue_bubble.png"
#define MED_IMAGE @"orange_bubble.png"
#define HIGH_IMAGE @"blue_bubble.png"

typedef enum _BCImageLevel {
  low = 1,
  medium = 2,
	high = 3
} BCImageLevel;

@interface BadgeCountTableCell : UITableViewCell {
  BCImageLevel level;
  UIImageView* icon;
  NSString* titleText;
  UILabel* countText;
  UIImageView* countBadge;
  UILabel* mainText;
}

@property (nonatomic, retain) IBOutlet UIImageView *icon;
@property (nonatomic, retain) IBOutlet UIImageView *countBadge;
@property (nonatomic, retain) IBOutlet UILabel *countText;
@property (nonatomic, retain) IBOutlet UILabel *mainText;
@property (nonatomic, retain) NSString *titleText;
@property (nonatomic, assign) BCImageLevel level;

- (id) initWithLevel:(BCImageLevel)level 
             andText:(NSString*)displayText
            andCount:(NSUInteger)count
             andIcon:(UIImage*)iconImage 
  andReuseIdentifier:(NSString*)reuseIdentifier;

@end
