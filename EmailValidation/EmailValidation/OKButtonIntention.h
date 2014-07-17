//
//  OKButtonIntention.h
//  EmailValidation
//
//  Created by Manuel Meyer on 17.07.14.
//  Copyright (c) 2014 vs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKButtonIntention : NSObject

-(instancetype)initWithButton:(UIButton *)button
                  actionBlock:(void(^)(UIButton *button)) actionBlock;
@end
