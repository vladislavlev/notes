//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import "ComposeViewController.h"
#import "AccessDataProvider.h"
#import "Note.h"
#import "Constants.h"
#import "UIColor+Layout.h"

@implementation ComposeViewController

#pragma mark - UIKit

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor backgroundColor];
}

#pragma mark - IBActions

- (IBAction)save:(id)sender {
  
  NSDictionary *parameters = @{ParameterName: AddingNoteParameter,SessionName: self.session, NoteBody : self.textView.text};
  [AccessDataProvider request:parameters completionHandler:^(id data) {
  }];
}

@end
