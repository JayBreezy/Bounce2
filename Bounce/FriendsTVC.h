//  FriendsTVC.h
//  Bounce

#import <UIKit/UIKit.h>

@interface FriendsTVC : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *friendsList;

@end
