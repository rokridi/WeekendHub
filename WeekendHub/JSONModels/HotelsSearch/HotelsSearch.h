//
//  HotelsSearch.h
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hotel;

@interface HotelsSearch : NSObject

//Represents how many hotels found.
@property (nonatomic, assign) NSUInteger totalCount;

//Array of Hotel instances.
@property (nonatomic, strong) NSArray *hotels;

@end
