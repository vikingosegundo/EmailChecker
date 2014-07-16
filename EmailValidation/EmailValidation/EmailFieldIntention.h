//  EmailFieldIntention.h
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailFieldIntention : NSObject

-(instancetype)initWithEmailField:(UITextField *)emailTextField;

-(instancetype)initWithEmailField:(UITextField *)emailTextField
              textEnterCompletion:(void(^)(BOOL isValid, UITextField *emailField)) completionBlock;

@end
