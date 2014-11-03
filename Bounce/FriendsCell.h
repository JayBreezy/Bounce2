//  FriendsCell.h
//  Bounce

#import <UIKit/UIKit.h>

@interface FriendsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *friends;
@property (nonatomic, weak) IBOutlet UIButton *bounceButton;

@end
