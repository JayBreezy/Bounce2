/////////////BEGIN SoundCloudTrack_M

//

//  SoundCloudTrack.m

//  LibSoundCloud

//

//  Created by juhills on 10/28/14.

//  Copyright (c) 2014 Stofkat. All rights reserved.

//


#import "SoundCloudTrack.h"


@implementation SoundCloudTrack


- (UIImage *) imageToDisplay {
    
    
    
    if ([self.thumbnail isEqual: [NSNull null]]){
        //change to some default bounce picture
        return [UIImage imageNamed:@"cock.png"];
        
    }
    
    
    
    NSString * copy = [[NSString alloc] initWithString:self.thumbnail];
    
    copy = [copy stringByReplacingOccurrencesOfString:@"-large."
            
                                           withString:@"-t67x67."];
    
    
    NSURL * urlToGrab = [NSURL URLWithString:copy];
    
    NSData *imageData = [NSData dataWithContentsOfURL:urlToGrab];
    
    return [UIImage imageWithData:imageData];
    
}


@end