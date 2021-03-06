//
//  OBNetwork+UnitTests.m
//  Outbound
//
//  Created by Emilien Huet on 1/30/16.
//  Copyright © 2016 Outbound.io. All rights reserved.
//

#import "OBNetwork+UnitTests.h"

@implementation OBNetwork (UnitTests)

+ (void)getPath:(NSString *)path withAPIKey:(NSString *)key andCompletion:(void (^)(id json, NSInteger statusCode, NSError *error))completion {
    if ([path hasPrefix:@"i/config/sdk"]) {
        
        BOOL sdkEnabled = ![key isEqualToString:@"disabled"];
        NSDictionary *response = @{
          @"account": @{
                  @"prompt": @YES,
                  @"prompt_event": @"testEvent"
                  },
          @"enabled": @(sdkEnabled)
          };
        
        if ([key isEqualToString:@"wait"]) {
            // delay response by 5 seconds
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                completion(response, 200, nil);
            });
        } else {
            completion(response, 200, nil);
        }
    }
}

@end
