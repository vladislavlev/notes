//
//  NotesViewController.h
//  Notes
//
//  Created by Andrew Vladislavlev on 05/05/17.
//  Copyright (c) 2017 Andrew Vladislavlev. All rights reserved.
//

#import "AccessDataProvider.h"
#import "Note.h"
#import "Constants.h"

@implementation AccessDataProvider

+ (void)request:(id)parameters completionHandler:(void (^)(id data))completionHandler  {
  
  AFHTTPSessionManager *manager =
  [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:Url]];
  AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
  manager.requestSerializer = serializer;
  [manager.requestSerializer setValue:Token forHTTPHeaderField:TokenParameter];
  [manager POST:Url parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    id data = responseObject[ServerData];
    completionHandler(data);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
}

@end
