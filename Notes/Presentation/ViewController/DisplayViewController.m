//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import "DisplayViewController.h"
#import "NSString+DateConvertation.h"


@implementation DisplayViewController

#pragma mark - UIKit

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.creationDateLabel.text = [self.note.creationDate convertToDate];
  self.textView.text = self.note.text;
  if ([self.note.modificationDate isEqualToString:self.note.creationDate]) return;
  self.modificationDateLabel.text = self.note.modificationDate;
}

@end
