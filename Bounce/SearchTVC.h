//  SearchTVC.h
//  Bounce

#import <UIKit/UIKit.h>

@interface SearchTVC : UITableViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray * SoundCloudTracksList;

- (void)playSong:(UIButton*) sender;
- (void)continueToFriends:(UIButton *)sender;

@end
