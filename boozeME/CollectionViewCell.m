//
//  CollectionViewCell.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Booze.h"

@interface CollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation CollectionViewCell

- (void)setImage:(Booze *)booze {
  self.imageView.image = booze.image;
  _booze = booze;
}

@end
