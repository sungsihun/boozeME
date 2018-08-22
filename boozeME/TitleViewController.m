//
//  TitleViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "TitleViewController.h"
#import "Booze.h"
#import "TableViewCell.h"
#import "NetworkManager.h"

@interface TitleViewController ()
@property (nonatomic) NSArray<Booze*> *objects;
@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _objects = [@[] mutableCopy];
  NSLog(@"Getting Booze");
  [NetworkManager getInfo:^(NSMutableArray *boozes) {
    self.objects = boozes;
    NSLog(@"View controller got data: %@", self.objects);

  }];
  
}



@end
