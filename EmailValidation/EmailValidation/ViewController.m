//
//  ViewController.m
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "ViewController.h"
#import "EmailFieldIntention.h"
#import "OKButtonIntention.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (nonatomic, strong) EmailFieldIntention *emailIntention;
@property (nonatomic, strong) OKButtonIntention *okButtonIntention;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.emailField setAdjustsFontSizeToFitWidth:YES];
    [self.emailField becomeFirstResponder];
    self.emailIntention = [[EmailFieldIntention alloc] initWithEmailField:self.emailField
                                                      textEnterCompletion:^(BOOL isValid, UITextField *emailField, NSString *text)
    {
        
        emailField.backgroundColor = (isValid) ? [UIColor greenColor] : [UIColor redColor];
        NSLog(@"%@: %@", (isValid) ? @"valid" : @"invalid", text);
    }];
    
    self.okButtonIntention = [[OKButtonIntention alloc] initWithButton:self.okButton
                                                           actionBlock:^(UIButton *button)
    {
        [self.emailField resignFirstResponder];
    }];
}

@end
