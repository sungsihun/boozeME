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
    _name = info[@"name"];
    _price = info[@"price_in_cents"];
    _alcoholContent = info[@"alcohol_content"];
    _servingSuggestion = info[@"serving_suggestion"];
    _tastingNote = info[@"tasting_note"];
    _style = info[@"style"];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:info[@"image_url"]]];
    _image = [UIImage imageWithData:data];

  }
  return self;
}






@end
