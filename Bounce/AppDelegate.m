//  AppDelegate.m
//  Bounce

#import "AppDelegate.h"
#import "TrackTVC.h"
#import "TabBarVC.h"
#import "LikesTVC.h"
#import "SearchTVC.h"
#import "FriendsTVC.h"
#import "LoginVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //LoginVC *loginVC = [[LoginVC alloc] init];
    
    TrackTVC *trackTVC = [[TrackTVC alloc] init];

    LikesTVC *likesTVC = [[LikesTVC alloc] init];
    
    SearchTVC *searchTVC = [[SearchTVC alloc] init];
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor whiteColor],
                                                            NSFontAttributeName: [UIFont boldSystemFontOfSize:30.0f],
                                                            }];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.13 green:0.84 blue:0.83 alpha:1.0]];
    
    UINavigationController *trackNavController = [[UINavigationController alloc] initWithRootViewController:trackTVC];
    trackNavController.title = @"Inbox";
    trackNavController.tabBarItem.image = [UIImage imageNamed:@"list-fat-7.png"];
    
    UINavigationController *likesNavController = [[UINavigationController alloc] initWithRootViewController:likesTVC];
    likesNavController.title = @"Likes";
    likesNavController.tabBarItem.image = [UIImage imageNamed:@"star-7.png"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:searchTVC];
    navController.title = @"Search";
    navController.tabBarItem.image = [UIImage imageNamed:@"search-7.png"];
    
    NSArray *tabViewControllers = [NSArray arrayWithObjects:trackNavController, likesNavController, navController, nil];
    
    TabBarVC *tabVC = [[TabBarVC alloc] init];
    tabVC.viewControllers = tabViewControllers;
    
    self.window.rootViewController = tabVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
