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

@implementation ComposeViewController

#pragma mark - IBActions

- (IBAction)save:(id)sender {
  
  NSDictionary *parameters = @{ParameterName: AddingNoteParameter,SessionName: self.session, NoteBody : self.textField.text};
  
  [AccessDataProvider request:parameters completionHandler:^(id data) {
  }];
}


@end
