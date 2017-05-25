//
//  Note.h
//  SwipeableTableCell
//
//  Created by Andrew Vladislavlev on 05.05.17.
//  Copyright © 2017 Andrew Vladislavlev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

#pragma mark - Properties

@property (nonatomic, copy) NSString *creationDate;
@property (nonatomic, copy) NSString *modificationDate;
@property (nonatomic, copy) NSString *text;

@end
