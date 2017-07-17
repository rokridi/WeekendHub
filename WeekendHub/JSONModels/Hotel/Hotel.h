//
//  Hotel.h
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weekend;

@interface Hotel : NSObject

@property (nonatomic, assign) NSUInteger identifier;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) double average;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) NSArray *weekend;//Array of Weekend instances.


@end
