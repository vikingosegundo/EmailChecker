//
//  Validator.m
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "Validator.h"

@implementation Validator

-(instancetype)initWithValidationBlock:(BOOL (^)(NSString *))validatorBlock
{
    if(self = [super init]){
        self.validatorBlock = validatorBlock;
    }
    
    return self;
}

-(BOOL)isValidAddress:(NSString *)address
{
    return self.validatorBlock(address);
}

@end