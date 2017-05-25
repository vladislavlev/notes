//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AccessDataProvider : NSObject

+ (void)request:(id)parameters completionHandler:(void (^)(id data))completionHandler;

@end
