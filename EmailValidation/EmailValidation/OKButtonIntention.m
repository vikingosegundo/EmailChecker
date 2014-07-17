//
//  OKButtonIntention.m
//  EmailValidation
//
//  Created by Manuel Meyer on 17.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import "OKButtonIntention.h"

@interface OKButtonIntention ()
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, copy) void (^actionBlock)(UIButton *);
@end

@implementation OKButtonIntention

-(instancetype)initWithButton:(UIButton *)button actionBlock:(void (^)(UIButton *))actionBlock
{
    if (self = [super init]) {
        self.button = button;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        self.actionBlock = actionBlock;
    }
    return self;
}


-(void) action:(UIButton *)button
{
    self.actionBlock(button);
}

@end
