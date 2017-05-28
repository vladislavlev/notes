//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITextView *textView;

#pragma mark - Properties

@property (strong, nonatomic) NSArray *notes;
@property (strong, nonatomic) NSString *session;

@end
