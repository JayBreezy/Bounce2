//  TrackTableViewCell.h
//  Bounce

#import <UIKit/UIKit.h>

@interface TrackTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *albumArtImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistLabel;
@property (nonatomic, weak) IBOutlet UILabel *isFromLabel;
@property (nonatomic, weak) IBOutlet UILabel *ageLabel;
@property (nonatomic, weak) IBOutlet UIButton *bounceButton;
@property (nonatomic, weak) IBOutlet UIButton *likeButton;

@end
