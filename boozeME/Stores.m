//
//  Stores.m
//  boozeME
//
//  Created by NICE on 2018-08-23.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "Stores.h"

@implementation Stores

- (instancetype)initWithInfo:(NSDictionary*)info {
  if (self = [super init]) {
    _title = info[@"name"];
    _latitude = info[@"latitude"];
    _longitude = info[@"longitude"];
    _coordinate = CLLocationCoordinate2DMake([_latitude doubleValue],[_longitude doubleValue]);
    
  }
  return self;
}


@end
