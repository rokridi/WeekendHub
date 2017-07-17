//
//  Weekend.m
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import "Weekend.h"
#import <YYModel/YYModel.h>

static NSString * const IdentifierJSONKey = @"id";
static NSString * const LabelJSONKey = @"label";
static NSString * const SellPriceJSONKey = @"price.sellPrice";
static NSString * const RefPriceJSONKey = @"price.refPrice";
static NSString * const PromoPercentageRoundedJSONKey = @"price.promoPercentageRounded";
static NSString * const ImageURLJSONKey = @"imageUrl";
static NSString * const TopThemeJSONKey = @"topTheme";
static NSString * const ProgramIntroJSONKey = @"programIntro";

@implementation Weekend

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
             @"sellPrice": SellPriceJSONKey,
             @"refPrice": RefPriceJSONKey,
             @"promoPercentageRounded": PromoPercentageRoundedJSONKey,
             @"imageUrl": ImageURLJSONKey,
             @"topTheme": TopThemeJSONKey,
             @"programIntro": ProgramIntroJSONKey
             };
}

@end
