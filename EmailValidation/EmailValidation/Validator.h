//
//  Validator.h
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Validator <NSObject>
-(BOOL)isValidAddress:(NSString *)address;
@end


@interface Validator : NSObject<Validator>
@property (nonatomic, copy) BOOL (^validatorBlock)(NSString *email);

-(instancetype)initWithValidationBlock:(BOOL(^)(NSString *email))validatorBlock;

@end