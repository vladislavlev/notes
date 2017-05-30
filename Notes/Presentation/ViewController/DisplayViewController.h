//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface DisplayViewController : UIViewController

#pragma mark - Properties

@property (strong, nonatomic) Note *note;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *creationDateLabel;

@end
