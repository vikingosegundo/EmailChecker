//
//  EmailChecker.m
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "EmailChecker.h"

@implementation EmailChecker

+(BOOL)checkEmailAddress:(NSString *)address
{
    
    static Validator *emailValidator;
    
    if(!emailValidator){
        
        Validator *atExistsValidator = [[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            NSRange rangeOfAt = [email rangeOfString:@"@"];
            if (rangeOfAt.location == NSNotFound) {
                return NO;
            }
            return YES;
        }];
        
        Validator *atNotAtBeginning = [[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            NSRange rangeOfAt = [email rangeOfString:@"@"];
            return rangeOfAt.location > 0;
        }];
        
        Validator *atNotAtEnd = [[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            NSRange rangeOfAt = [email rangeOfString:@"@"];
            return rangeOfAt.location < [email length]-1;
        }];
        
        Validator *atFollowedByPoint =[[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            NSString *regex = @".+@.+\\..+";
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
            return [predicate evaluateWithObject:email];
        }];
        
        Validator *pointNotAtEnd = [[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            NSRange rangeOfAt = [email rangeOfString:@"."];
            return rangeOfAt.location < [email length]-1;
        }];
        
        Validator *onlyOneATOutsideQuotes = [[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            
            NSUInteger numberQuotes = 0;
            NSUInteger numberAtOutsideQuotes = 0;
            NSCharacterSet *symbols = [NSCharacterSet characterSetWithCharactersInString:@"\"@"];
            NSScanner *scanner = [[NSScanner alloc] initWithString:email];
            
            while (![scanner isAtEnd]) {
                [scanner scanUpToCharactersFromSet:symbols intoString:nil];
                
                if(![scanner isAtEnd]){
                    if ([[email substringWithRange:NSMakeRange(scanner.scanLocation, 1)] isEqualToString:@"\""]) {
                        ++numberQuotes;
                    } else {
                        if (numberQuotes % 2 == 0 || !numberQuotes) {
                            ++numberAtOutsideQuotes;
                        }
                    }
                    scanner.scanLocation = scanner.scanLocation +1;;
                }
            }
            
            return (numberAtOutsideQuotes == 1);
        }];
        
        emailValidator = [[Validator alloc] initWithValidationBlock:^BOOL(NSString *email) {
            static NSArray *rules;
            
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                rules = @[atExistsValidator, atNotAtBeginning, atNotAtEnd ,atFollowedByPoint, pointNotAtEnd, onlyOneATOutsideQuotes];
            });
            
            __block BOOL isValidAdress = YES;
            
            [rules enumerateObjectsUsingBlock:^(Validator *validator, NSUInteger idx, BOOL *stop) {
                if(![validator isValidAddress:email]){
                    isValidAdress = NO;
                    *stop = YES;
                }
            }];
            return isValidAdress;
        }];        
    }
    return [emailValidator isValidAddress:address];
}

@end
