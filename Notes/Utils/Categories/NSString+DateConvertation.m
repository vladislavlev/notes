//
//  DateConvertation.m
//  Notes
//
//  Created by Andrew Vladislavlev on 19.05.17.
//  Copyright © 2017 Andrew Vladislavlev. All rights reserved.
//

#import "NSString+DateConvertation.h"

@implementation NSString (DateConvertation)

- (NSString *)convertToDate {
  NSDate *now = [NSDate date];
  double secondsSince1970 = [now timeIntervalSince1970];
  double timeDifference = secondsSince1970 - [self intValue];
  NSDate *date = [NSDate dateWithTimeInterval:-timeDifference sinceDate:now];
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"dd MMMM yyyy HH:mm"];
  NSString *stringFromDate = [formatter stringFromDate:date];
  return stringFromDate;
}

@end
