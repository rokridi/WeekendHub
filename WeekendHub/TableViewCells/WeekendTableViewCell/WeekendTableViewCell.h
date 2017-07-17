//
//  WeekendTableViewCell.h
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const WeekendTableViewCellIdentifier;

@class Weekend;

@interface WeekendTableViewCell : UITableViewCell

@property (nonatomic, strong) Weekend *weekend;

@end
