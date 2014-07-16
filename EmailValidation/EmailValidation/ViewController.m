//
//  ViewController.m
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "ViewController.h"
#import "EmailFieldIntention.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (nonatomic, strong) EmailFieldIntention *emailIntention;
- (IBAction)okAction:(id)sender;
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.emailField setAdjustsFontSizeToFitWidth:YES];
    [self.emailField becomeFirstResponder];
    self.emailIntention = [[EmailFieldIntention alloc] initWithEmailField:self.emailField
                                                      textEnterCompletion:^(BOOL isValid, UITextField *emailField)
    {
        if (isValid) {
            NSLog(@"valid: %@", emailField.text);
            emailField.backgroundColor = [UIColor greenColor];
        } else {
            NSLog(@"invalid: %@", emailField.text);
            emailField.backgroundColor = [UIColor redColor];
        }
    }];
}



- (IBAction)okAction:(id)sender {
    
    [self.emailField resignFirstResponder];
}
@end
