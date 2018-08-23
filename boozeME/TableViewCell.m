//
//  TableViewCell.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "TableViewCell.h"


@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation TableViewCell

-(void)setLabelWithString:(NSString*)string {
  self.label.text = string;
}
-(void)setImageViewWithImage:(UIImage*)image {
  self.imageView.image = image;
}


@end
