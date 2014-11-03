//
//  LoginVC.h
//  Bounce
//
//  Created by Ryan Sanna on 10/29/14.
//  Copyright (c) 2014 Bounce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarVC.h"

@interface LoginVC : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) NSString *username;

- (NSString *)pressedDone:(UITextField *)sender;

- (void)goToInbox:(UIButton*) sender;

@end
