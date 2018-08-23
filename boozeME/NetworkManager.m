//
//  NetworkManager.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "NetworkManager.h"
#import "Booze.h"

@implementation NetworkManager

+(void)getInfo:(NSURL *)url with: (void (^)(NSMutableArray *))completion {

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"Token token=MDo2ZmI3OTY1ZS1hNjBkLTExZTgtYjAwMS1mM2U4OTFhNmEzYjk6bjh6ZGRzYWhiVkNhYjE3N0FmRG9mejRWeUJHQU9JdmpoUXJx" forHTTPHeaderField:@"Authorization"];
    
    NSLog(@"creating task");
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//      NSLog(@"completed request: %@", response);
      
      if (error != nil) {
//        NSLog(@"error making the request: %@", error.localizedDescription);
        abort();
      }
      
      NSInteger statusCode = [(NSHTTPURLResponse*)response statusCode];
      if (statusCode < 200 || statusCode >=300) {
//        NSLog(@"Non-ok error code: %@", response);
        abort();
      }
      
      NSError *jsonError = nil;
      NSDictionary *info = [NSJSONSerialization
                            JSONObjectWithData:data
                            options:0
                            error:&jsonError];
      
      if (jsonError != nil) {
       NSLog(@"Error parsing JSON %@", jsonError.localizedDescription);
        abort();
      }
      
      NSMutableArray *boozes = [@[] mutableCopy];
      for (NSDictionary *booze in info[@"result"]) {
//        NSLog(@"getting the info data: %@", booze);
        [boozes addObject:[[Booze alloc] initWithInfo:booze]];
      }
      completion(boozes);
    }];
    
    NSLog(@"Created Task");
    [task resume];
    NSLog(@"Resumed task");
  
  
  
}

@end
