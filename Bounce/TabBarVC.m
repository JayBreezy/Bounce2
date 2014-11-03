//  TabBarVC.m
//  Bounce

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIColor *themeColor = [UIColor colorWithRed:.13
                                          green:.84
                                           blue:.83
                                          alpha:1.0];
    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.barTintColor = themeColor;
    
    //can change tab bar item's appearance based on selection State
    //using [UITabBarItem appearance]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
