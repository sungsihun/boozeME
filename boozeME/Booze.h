//
//  Booze.h
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Booze : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *servingSuggestion;
@property (nonatomic) NSString *tastingNote;
@property (nonatomic) NSString *style;
@property (nonatomic) NSString *alcoholContent;
@property (nonatomic) UIImage *image;
-(instancetype)initWithInfo:(NSDictionary*) info;
@end
