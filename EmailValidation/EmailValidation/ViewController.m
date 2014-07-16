//
//  ViewController.m
//  EmailValidation
//
//  Created by Manuel Meyer on 16.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "ViewController.h"
#import "EmailChecker.h"


@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)okAction:(id)sender;
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.emailField setAdjustsFontSizeToFitWidth:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    BOOL isValidEmail = [EmailChecker checkEmailAddress:textField.text];
    if (!isValidEmail) {
        textField.backgroundColor = [UIColor redColor];
    } else {
        textField.backgroundColor = [UIColor greenColor];
    }
}
- (IBAction)okAction:(id)sender {
    
    [self.emailField resignFirstResponder];
}
@end
