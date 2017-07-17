//
//  Weekend.h
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weekend : NSObject

@property (nonatomic, assign) NSUInteger identifier;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, assign) NSUInteger sellPrice;
@property (nonatomic, assign) NSUInteger refPrice;
@property (nonatomic, assign) NSUInteger promoPercentageRounded;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSArray *topTheme;
@property (nonatomic, strong) NSArray *programIntro;

@end
