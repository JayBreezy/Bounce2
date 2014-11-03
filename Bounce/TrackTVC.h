//  TrackTVC.h
//  Bounce

#import <UIKit/UIKit.h>

@interface TrackTVC : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * SoundCloudTracksList;

- (void)likeSong:(UIButton *)sender;
- (void)bounceSong:(UIButton *)sender;

- (void)processTracks;

@end
