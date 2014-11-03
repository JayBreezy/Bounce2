//
//  SearchCell.h
//  Bounce
//
//  Created by Ryan Sanna on 10/28/14.
//  Copyright (c) 2014 Bounce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *albumArtView;
@property (nonatomic, weak) IBOutlet UILabel *trackName;
@property (nonatomic, weak) IBOutlet UILabel *userName;
@property (nonatomic, weak) IBOutlet UIButton *playButton;
@property (nonatomic, weak) IBOutlet UIButton *continueButton; 

- (IBAction)playPressed:(id)sender;

@end
