//
//  WeekendsHTTPSessionManager.h
//  WeekendHub
//
//  Created by Mohamed Aymen Landolsi on 13/07/2017.
//  Copyright © 2017 PSA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class HotelsSearch;

typedef NS_ENUM(NSUInteger, OrderBy){
    
    OrderByPriceQuality = 0
};

@interface WeekendsHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

/*
 Fetches the list of hotels from the servers.
 
 @param locale The locale.
 @param ordeBy The order of the list of the hotels.
 @param limit Page size.
 @param page Page number.
 @param success the callback which will be called in case of success.
 @param failure the callback which will be called in case of failure.
 
 @return The task representing the HTTP request.
 */
- (NSURLSessionDataTask *)weekendsForLocale:(NSString *)locale orderedBy:(OrderBy)orderBy limit:(NSUInteger)limit page:(NSUInteger)page success:(void (^)(HotelsSearch *result))success failure:(void (^)(NSError * error))failure;

@end
