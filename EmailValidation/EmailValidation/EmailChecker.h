//
//  EmailChecker.h
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Validator.h"


@interface EmailChecker : NSObject
+(BOOL)checkEmailAddress:(NSString *)address;
@end
