//
//  Hotel.m
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import "Hotel.h"
#import "Weekend.h"
#import <YYModel/YYModel.h>

static NSString * const IdentifierJSONKey = @"id";
static NSString * const LabelJSONKey = @"label";
static NSString * const LongitudeJSONKey = @"location.lng";
static NSString * const LatitudeJSONKey = @"location.lat";
static NSString * const AddressJSONKey = @"location.address";
static NSString * const AverageJSONKey = @"review.average";
static NSString * const CountJSONKey = @"review.count";
static NSString * const WeekendJSONKey = @"weekend";

@implementation Hotel

#pragma mark - YYModel.h

/**
 Custom property mapper.
 
 @discussion If the key in JSON/Dictionary does not match to the model's property name,
 implements this method and returns the additional mapper.
 
 Example:
 
 json:
 {
 "n":"Harry Pottery",
 "p": 256,
 "ext" : {
 "desc" : "A book written by J.K.Rowling."
 },
 "ID" : 100010
 }
 
 model:
 @interface YYBook : NSObject
 @property NSString *name;
 @property NSInteger page;
 @property NSString *desc;
 @property NSString *bookID;
 @end
 
 @implementation YYBook
 + (NSDictionary *)modelCustomPropertyMapper {
 return @{@"name"  : @"n",
 @"page"  : @"p",
 @"desc"  : @"ext.desc",
 @"bookID": @[@"id", @"ID", @"book_id"]};
 }
 @end
 
 @return A custom mapper for properties.
 */
+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"identifier": IdentifierJSONKey,
             @"label": LabelJSONKey,
             @"longitude": LongitudeJSONKey,
             @"latitude": LatitudeJSONKey,
             @"address": AddressJSONKey,
             @"average": AverageJSONKey,
             @"count": CountJSONKey,
             @"weekend": WeekendJSONKey
             };
}

/**
 The generic class mapper for container properties.
 
 @discussion If the property is a container object, such as NSArray/NSSet/NSDictionary,
 implements this method and returns a property->class mapper, tells which kind of
 object will be add to the array/set/dictionary.
 
 Example:
 @class YYShadow, YYBorder, YYAttachment;
 
 @interface YYAttributes
 @property NSString *name;
 @property NSArray *shadows;
 @property NSSet *borders;
 @property NSDictionary *attachments;
 @end
 
 @implementation YYAttributes
 + (NSDictionary *)modelContainerPropertyGenericClass {
 return @{@"shadows" : [YYShadow class],
 @"borders" : YYBorder.class,
 @"attachments" : @"YYAttachment" };
 }
 @end
 
 @return A class mapper.
 */
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"weekend" : [Weekend class]};
}

@end
