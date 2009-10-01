//
//  NSDate+HumanDate.m
//  Created by Mark Jones on 10/1/09.
//  Copyright 2009 Geordie Enterprises LLC. All rights reserved.
//

#import "NSDate+HumanDate.h"


@implementation NSDate(HumanDate)


- (NSString*)humanDate {
  
  NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  
  NSDateComponents* weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:self];
  int weekdayIndex = [weekdayComponents weekday];
  NSString* formattedDate;
  
  NSDateComponents* distanceOfDate = [gregorian components:NSDayCalendarUnit fromDate:[NSDate date] toDate:self options:0];
  int daysToDate = [distanceOfDate day];
  
  if (daysToDate >= 7) {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    formattedDate = [df stringFromDate:self];
  }
  else if (daysToDate == 0) {
    formattedDate = @"Today";
  }
  else if (daysToDate == -1){
    formattedDate = @"Yesterday";
  }
  else if (daysToDate < 0) {
    formattedDate  = [NSString stringWithFormat:@"Due %d days ago",abs(daysToDate)];
  }
  else if (daysToDate == 1) {
    formattedDate = @"Tomorrow";
  }
  else {
    switch (weekdayIndex) {
      case 1:
        formattedDate = @"Sunday";
        break;
      case 2:
        formattedDate = @"Monday";
        break;
      case 3:
        formattedDate = @"Tuesday";
        break;
      case 4:
        formattedDate = @"Wednesday";
        break;
      case 5:
        formattedDate = @"Thursday";
        break;
      case 6:
        formattedDate = @"Friday";
        break;
      case 7:
        formattedDate = @"Saturday";
        break;
      default:
        break;
    }
    
  }
  return formattedDate;
  
}

@end
