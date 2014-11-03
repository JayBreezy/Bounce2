//
//  LoginVC.m
//  Bounce
//
//  Created by Ryan Sanna on 10/29/14.
//  Copyright (c) 2014 Bounce. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *splashView = [[UIImageView alloc] initWithFrame:self.view.frame];
    splashView.image = [UIImage imageNamed:@"Default-568h@2x.png"];
    
    UITextField *loginField = [[UITextField alloc] initWithFrame:CGRectMake(90, 320, 140, 30)];
    loginField.placeholder = @"username";
    loginField.borderStyle = UITextBorderStyleRoundedRect;
    loginField.returnKeyType = UIReturnKeyDone;
    loginField.textAlignment = NSTextAlignmentCenter;
    loginField.userInteractionEnabled = YES;
    loginField.delegate = self;
    
    [loginField addTarget:self action:@selector(pressedDone:) forControlEvents:UIControlEventTouchUpInside];
    [splashView addSubview:loginField];
    
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 340, 70, 20)];
    [testButton addTarget:self action:@selector(goToInbox:) forControlEvents:UIControlEventTouchUpInside];
    [splashView addSubview:testButton];
    
    [self.view addSubview:splashView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pressedDone:(UITextField *)sender
{
    return nil;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)goToInbox:(UIButton*) sender
{
    TabBarVC *newTabBar = [[TabBarVC alloc] init];
    [self presentViewController:newTabBar  animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
