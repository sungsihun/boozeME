//
//  Stores.h
//  boozeME
//
//  Created by NICE on 2018-08-23.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@import MapKit;

@interface Stores : NSObject <MKAnnotation>
@property (nonatomic,copy) NSString *title;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
- (instancetype)initWithInfo:(NSDictionary*)info;

@end
