//
//  NetworkManager.h
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+(void)getInfo:(void (^)(NSMutableArray *))completion;

@end
