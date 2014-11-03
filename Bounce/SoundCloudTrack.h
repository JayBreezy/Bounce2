//////BEGIN SoundCloudTrack_H

//

//  SoundCloudTrack.h

//  LibSoundCloud

//

//  Created by juhills on 10/28/14.

//  Copyright (c) 2014 Stofkat. All rights reserved.

//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define SC_API_URL @"https://api.soundcloud.com"
#define CLIENT_ID @"dfcb0ace5fb36fb38fc0705d8e80b98b"


@interface SoundCloudTrack : NSObject

@property (strong, nonatomic)  NSString * title;

@property (strong, nonatomic)  NSString * thumbnail;

@property (strong, nonatomic)  NSString * ID;

@property (strong, nonatomic)  NSString * username;

//USED ONLY IN INBOX
@property (strong, nonatomic) NSString * senderOfSong;


- (UIImage *)imageToDisplay;


@end