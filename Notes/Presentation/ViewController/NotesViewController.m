//
//  NotesViewController.m
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.

#import "NotesViewController.h"
#import "TableViewCell.h"
#import "AFNetworking.h"
#import "Note.h"
#import "AccessDataProvider.h"
#import "ComposeViewController.h"
#import "DisplayViewController.h"
#import "NSString+DateConvertation.h"
#import "Constants.h"
#import "MTLJSONAdapter.h"
#import "UIColor+Layout.h"

@interface NotesViewController () <UINavigationControllerDelegate>

#pragma mark - Properties

@property (strong, nonatomic) NSString *session;
@property (strong, nonatomic) NSMutableArray *notes;

@end

@implementation NotesViewController

#pragma mark - UIKit

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.backgroundColor = [UIColor backgroundColor];
  self.navigationController.navigationBar.tintColor = [UIColor themeColor];
  [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"background"]
                           forBarMetrics:UIBarMetricsDefault];
  self.navigationController.navigationBar.translucent = YES;
  self.tableView.tableFooterView = [[UIView alloc] init];
  self.notes = [NSMutableArray array];
  self.navigationController.delegate = self;
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  
  if (![userDefaults stringForKey:SessionName]) {
    NSDictionary *parameters = @{ParameterName: NewSessionParameter};
    [AccessDataProvider request:parameters completionHandler:^(NSDictionary *data) {
      self.session = data[SessionName];
      [userDefaults setObject:data[SessionName] forKey:SessionName];
      [self updateNotes];
    }];
    return;
  }
  self.session = [userDefaults objectForKey:SessionName];
}

#pragma mark - IBActions

- (IBAction)addButtonPressed:(id)sender {
  [self performSegueWithIdentifier:ShowCompopseControllerSeque sender:self];
}

#pragma mark - Update

- (void)updateNotes {
  [[UIApplication sharedApplication]
   setNetworkActivityIndicatorVisible:YES];
  if (!self.session) return;
  NSDictionary *parameters = @{ParameterName: GettingNotesParameter,SessionName: self.session};
  [AccessDataProvider request:parameters completionHandler:^(id data) {
    
    NSArray *notesData = data[0];
    NSUInteger notesCount = [notesData count];
    [self.notes removeAllObjects];
    
    for (int i = 0; i < notesCount; i++)
    {
      NSDictionary *noteData = notesData[i];
      NSError *error = nil;
      Note *note = [MTLJSONAdapter modelOfClass:Note.class fromJSONDictionary:noteData error:&error];
      [self.notes addObject: note];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
      
      [[UIApplication sharedApplication]
       setNetworkActivityIndicatorVisible:NO];
      [self.tableView reloadData];
    });
  }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:ShowCompopseControllerSeque]) {
    
    ComposeViewController *ComposeViewController = [segue destinationViewController];
    ComposeViewController.session = self.session;
  }
  else if ([[segue identifier] isEqualToString:ShowDetailControllerSeque]) {
    
    DisplayViewController *displayViewController = [segue destinationViewController];
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    displayViewController.note = self.notes[selectedIndexPath.row];
  }
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self performSegueWithIdentifier:ShowDetailControllerSeque sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  return [self.notes count];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusableCellIdentifier forIndexPath:indexPath];
  
  Note *note = self.notes[indexPath.row];
  cell.creationDateLabel.text = [note.creationDate convertToDate];
  cell.textView.text = note.text;
  return cell;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
  
  if ([viewController isEqual:self]) {
    
    [self updateNotes];
  }
}

@end

