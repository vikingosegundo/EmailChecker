//
//  EmailFieldIntention.m
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "EmailFieldIntention.h"
#import "EmailChecker.h"

@interface EmailFieldIntention () <UITextFieldDelegate>
@property (nonatomic, weak) UITextField *emailTextField;
@property (nonatomic, copy) void(^completionBlock)(BOOL isValid, UITextField *emailfield);
@end

@implementation EmailFieldIntention
-(instancetype)initWithEmailField:(id)emailTextField
{
    return [self initWithEmailField:emailTextField
                textEnterCompletion:^(BOOL isValid, UITextField *emailField) {

                    if (!isValid) {
                            emailField.backgroundColor = [UIColor redColor];
                        } else {
                            emailField.backgroundColor = [UIColor greenColor];
                        }

                }];
}

-(instancetype)initWithEmailField:(UITextField *)emailTextField
              textEnterCompletion:(void (^)(BOOL isValid, UITextField *emailField))completionBlock
{
    self = [super init];
    if (self) {
        self.emailTextField = emailTextField;
        self.completionBlock = completionBlock;
        self.emailTextField.delegate = self;
    }
    
    return self;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.completionBlock) {
        self.completionBlock([EmailChecker checkEmailAddress:textField.text], textField);
    }
}
@end
