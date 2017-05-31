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

#pragma mark - UIKit

- (void) viewWillAppear:(BOOL)paramAnimated{
  [super viewWillAppear:paramAnimated];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleKeyboardDidShow:)
                                               name:UIKeyboardDidShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleKeyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

#pragma mark - Notifications

- (void) handleKeyboardDidShow:(NSNotification *)paramNotification{
  
  NSValue *keyboardRectAsObject =
  [[paramNotification userInfo]
   objectForKey:UIKeyboardFrameEndUserInfoKey];
  CGRect keyboardRect = CGRectZero;
  [keyboardRectAsObject getValue:&keyboardRect];
  self.textView.contentInset = UIEdgeInsetsMake(0.0f,
                                                0.0f,
                                                keyboardRect.size.height,
                                                0.0f);
}

- (void) handleKeyboardWillHide:(NSNotification *)paramNotification{
  
  self.textView.contentInset = UIEdgeInsetsZero;
}

@end
