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
@property (nonatomic, copy) void(^completionBlock)(BOOL isValid, UITextField *emailfield, NSString *text);
@property (nonatomic, copy) void(^textChangedBlock)(NSString *text, UITextField *emailfield);

@end

@implementation EmailFieldIntention

-(instancetype)initWithEmailField:(id)emailTextField
{
    return [self initWithEmailField:emailTextField
                textEnterCompletion:^(BOOL isValid, UITextField *emailField, NSString *text)
            {
                emailField.backgroundColor = (isValid) ? [UIColor greenColor] : [UIColor redColor];
            }];
}

-(instancetype)initWithEmailField:(UITextField *)emailTextField
              textEnterCompletion:(void (^)(BOOL isValid, UITextField *emailField, NSString *text))completionBlock
{
    return [self initWithEmailField:emailTextField
                        textChanged:^(NSString *text, UITextField *emailField)
                        {
                            emailTextField.backgroundColor = [UIColor whiteColor];
                        }
                textEnterCompletion:completionBlock];
}

-(instancetype)initWithEmailField:(UITextField *)emailTextField
                      textChanged:(void (^)(NSString *text, UITextField *emailField))changeBlock
              textEnterCompletion:(void (^)(BOOL, UITextField *, NSString *text))completionBlock
{
    if (self = [super init]) {
        self.emailTextField = emailTextField;
        self.completionBlock = completionBlock;
        self.textChangedBlock = changeBlock;
        self.emailTextField.delegate = self;
        [self.emailTextField addTarget:self
                                action:@selector(textChanged:)
                      forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.completionBlock) {
        self.completionBlock([EmailChecker checkEmailAddress:textField.text], textField, textField.text);
    }
}


-(void)textChanged:(UITextField *)textField
{
    self.textChangedBlock(textField.text, textField);
}

@end
