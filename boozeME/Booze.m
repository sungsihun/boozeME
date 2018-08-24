//
//  Booze.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "Booze.h"

@implementation Booze

-(instancetype)initWithInfo:(NSDictionary*) info {
  if (self = [super init]) {
    
    if (info[@"id"] == (id)[NSNull null]) {
      _boozeID = @"no data";
    } else {
      _boozeID = info[@"id"];
    }
    
    if (info[@"name"] == (id)[NSNull null]) {
      _name = @"no data";
    } else {
      _name = info[@"name"];
    }
    
    if (info[@"price_in_cents"] == (id)[NSNull null]) {
      _price = @"no data";
    } else {
      _price = info[@"price_in_cents"];
    }
    
    if (info[@"alcohol_content"] == (id)[NSNull null]) {
      _alcoholContent = @"no data";
    } else {
      _alcoholContent = info[@"alcohol_content"];
    }
    
    
    if (info[@"serving_suggestion"] == (id)[NSNull null]) {
      _servingSuggestion = @"Goes great with pizza and cheese and chips!";
    } else {
      _servingSuggestion = info[@"serving_suggestion"];
    }
    
    if (info[@"tasting_note"] == (id)[NSNull null]) {
      _tastingNote = @"A taste of alcohol, and more!";
    } else {
      _tastingNote = info[@"tasting_note"];
    }
    
    if (info[@"style"] == (id)[NSNull null]) {
      _style = @"This has better style than you bud!";
    } else {
      _style = info[@"style"];
    }
    
    if (info[@"image_url"] == (id)[NSNull null]) {
      _image = [UIImage imageNamed:@"booze.jpg"];
    } else {
      NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:info[@"image_url"]]];
      _image = [UIImage imageWithData:data];
      

    }

  }
  return self;
}






@end
