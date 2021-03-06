//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import "Note.h"

@implementation Note

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  
  return @{@"creationDate": @"da", @"modificationDate": @"dm", @"text": @"body"};
}

@end
