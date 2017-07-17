//
//  WeekendsHTTPSessionManager.m
//  WeekendHub
//
//  Created by Mohamed Aymen Landolsi on 13/07/2017.
//  Copyright © 2017 PSA. All rights reserved.
//

#import "WeekendsHTTPSessionManager.h"
#import "HotelsSearch.h"
#import <YYModel/YYModel.h>

//Base URL
static NSString * const BaseURL = @"http://api.weekendesk.com/api/?orderBy=priceQuality&locale=fr_FR&limit=50&page=0";

//Weekends api end.
static NSString * const WeekendsApiEnd = @"weekends.json";

//URL parameters' names
static NSString * const OrderByURLParameter = @"orderBy";
static NSString * const LocaleURLParameter = @"locale";
static NSString * const LimitURLParameter = @"limit";
static NSString * const PageURLParameter = @"page";

//Orderby possible values
static NSString * const OrderByPriceQualityValue = @"priceQuality";

@implementation WeekendsHTTPSessionManager

+ (instancetype)sharedInstance {
    
    static WeekendsHTTPSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    
    return [super initWithBaseURL:[NSURL URLWithString:BaseURL]];
}

#pragma mark - Private

/**
 This method returns the name of the URL parameter corresponding to an OrdeBy enum member.

 @param ordeBy OrdeBy enum member.
 @return NSString representing the name of ordeBy.
 */
- (NSString *)orderByValueForOrderBy:(OrderBy)ordeBy {

    switch (ordeBy) {
        case OrderByPriceQuality:
            return OrderByPriceQualityValue;
            break;
            
        default:
            NSAssert(NO, @"Unknown ordeBy value : %lu", (unsigned long)ordeBy);
            break;
    }
}

#pragma mark - HTTP requests

- (NSURLSessionDataTask *)weekendsForLocale:(NSString *)locale orderedBy:(OrderBy)orderBy limit:(NSUInteger)limit page:(NSUInteger)page success:(void (^)(HotelsSearch *result))success failure:(void (^)(NSError * error))failure {
    
    //Create request parameters.
    NSDictionary *requestParameters = @{
                                        OrderByURLParameter: [self orderByValueForOrderBy:orderBy],
                                        LocaleURLParameter: locale,
                                        LimitURLParameter: @(limit),
                                        PageURLParameter: @(page)
                                        };
    
    //Launch the HTTP request.
    return [self GET:WeekendsApiEnd parameters:requestParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            
            //Create a HotelsSearch from the received JSON.
            HotelsSearch *hotelSearch = [HotelsSearch yy_modelWithJSON:responseObject];
            
            success(hotelSearch);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

@end
