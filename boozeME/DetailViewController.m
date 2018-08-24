//
//  DetailViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "DetailViewController.h"
#import "Booze.h"

@interface DetailViewController () <UIScrollViewDelegate>
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *priceLabel;
@property (nonatomic) UILabel *servingLabel;
@property (nonatomic) UILabel *tastingLabel;
@property (nonatomic) UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *button;
@property (nonatomic) NSMutableArray *favesArray;


@end

@implementation DetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  
  NSArray *temp = [[NSUserDefaults standardUserDefaults] objectForKey:@"test3"];
  if (temp) {
    self.favesArray = [temp mutableCopy];
  } else {
    self.favesArray = [@[] mutableCopy];
  }
  
  self.scrollView.delegate = self;
  
  // name label
  self.nameLabel = [[UILabel alloc] init];
  self.nameLabel.text = self.booze.name;
  self.nameLabel.textColor = UIColor.whiteColor;
  self.nameLabel.font = [UIFont fontWithName:@"Avenir Next" size:50];
  self.nameLabel.textAlignment = NSTextAlignmentCenter;
  self.nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.nameLabel.numberOfLines = 0;
  self.nameLabel.backgroundColor = UIColor.clearColor;
  [self.scrollView addSubview:self.nameLabel];
  
  self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.nameLabel.topAnchor
   constraintEqualToAnchor:self.scrollView.topAnchor constant:30].active = YES;
  [self.nameLabel.centerXAnchor
   constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
  [self.nameLabel.widthAnchor
   constraintEqualToAnchor:self.view.widthAnchor].active = YES;
  [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
  [self.nameLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;

  // image view
  self.imageView = [[UIImageView alloc] initWithImage:self.booze.image];
  self.imageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.scrollView addSubview:self.imageView];
  self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.imageView.widthAnchor constraintEqualToConstant:240].active = YES;
  [self.imageView.heightAnchor constraintEqualToConstant:280].active = YES;
  [self.imageView.centerXAnchor
   constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
  [self.imageView.topAnchor
   constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:50].active = YES;
  
//   price label
  self.priceLabel = [[UILabel alloc] init];
  self.priceLabel.text = [NSString stringWithFormat:@"$%.02f", self.booze.price.floatValue/100];
  self.priceLabel.backgroundColor = UIColor.clearColor;
  self.priceLabel.textColor = UIColor.whiteColor;
  self.priceLabel.font = [UIFont fontWithName:@"Avenir Next" size:30];
  self.priceLabel.textAlignment = NSTextAlignmentCenter;
  [self.scrollView addSubview:self.priceLabel];

  self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.priceLabel.topAnchor
   constraintEqualToAnchor:self.imageView.bottomAnchor constant:20].active = YES;
  [self.priceLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor].active = YES;
  [self.priceLabel.trailingAnchor constraintEqualToAnchor:self.nameLabel.trailingAnchor].active = YES;


//  // serving label
  self.servingLabel = [[UILabel alloc] init];
  self.servingLabel.text = self.booze.servingSuggestion;
  self.servingLabel.textColor = UIColor.whiteColor;
  self.servingLabel.font = [UIFont fontWithName:@"Avenir Next" size:20];
  self.servingLabel.textAlignment = NSTextAlignmentCenter;
  self.servingLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.servingLabel.numberOfLines = 0;
  self.servingLabel.backgroundColor = UIColor.clearColor;
  [self.scrollView addSubview:self.servingLabel];

  self.servingLabel.translatesAutoresizingMaskIntoConstraints = NO;

  [self.servingLabel.topAnchor
   constraintEqualToAnchor:self.priceLabel.bottomAnchor constant:50].active = YES;
  [self.servingLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor].active = YES;
  [self.servingLabel.trailingAnchor constraintEqualToAnchor:self.nameLabel.trailingAnchor].active = YES;




//  // testing label
  self.tastingLabel = [[UILabel alloc] init];
  self.tastingLabel.text = self.booze.tastingNote;
  self.tastingLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.tastingLabel.textAlignment = NSTextAlignmentCenter;
  self.tastingLabel.numberOfLines = 0;
  self.tastingLabel.textColor = UIColor.whiteColor;
  self.tastingLabel.font = [UIFont fontWithName:@"Avenir Next" size:20];
  self.tastingLabel.backgroundColor = UIColor.clearColor;
  [self.scrollView addSubview:self.tastingLabel];

  self.tastingLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.tastingLabel.topAnchor
   constraintEqualToAnchor:self.servingLabel.bottomAnchor constant:20].active = YES;
  [self.tastingLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor].active = YES;
  [self.tastingLabel.trailingAnchor constraintEqualToAnchor:self.nameLabel.trailingAnchor].active = YES;

//  // style label
  self.styleLabel = [[UILabel alloc] init];
  self.styleLabel.text = self.booze.style;
  self.styleLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.styleLabel.textAlignment = NSTextAlignmentCenter;
  self.styleLabel.numberOfLines = 0;
  self.styleLabel.textColor = UIColor.whiteColor;
  self.styleLabel.font = [UIFont fontWithName:@"Avenir Next" size:20];
  self.styleLabel.backgroundColor = UIColor.clearColor;
  [self.scrollView addSubview:self.styleLabel];

  self.styleLabel.translatesAutoresizingMaskIntoConstraints = NO;

  [self.styleLabel.topAnchor
   constraintEqualToAnchor:self.tastingLabel.bottomAnchor constant:20].active = YES;
  [self.styleLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor].active = YES;
  [self.styleLabel.trailingAnchor constraintEqualToAnchor:self.nameLabel.trailingAnchor].active = YES;
  //TODO add 50 constant to bottom
  [self.styleLabel.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  
}

- (IBAction)faveButton:(UIBarButtonItem *)sender {
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  
  if ([self.favesArray containsObject:self.booze.name] == NO) {
    [self.favesArray addObject:self.booze.name];
    
    [defaults setObject:self.favesArray forKey:@"test3"];
    [defaults synchronize];
    NSLog(@"Data saved");
    
    
    NSArray *temp = [[NSUserDefaults standardUserDefaults] objectForKey:@"test3"];
    NSLog(@"%@", temp);
  }
}

@end
