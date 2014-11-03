////////////BEGIN oldTableViewController_M
//
////
//
////  oldTableViewController.m
//
////  BlogReader
//
////
//
////  Created by Amit Bijlani on 12/6/12.
//
////  Copyright (c) 2012 Amit Bijlani. All rights reserved.
//
////
//
//#import <AVFoundation/AVFoundation.h>
//
//#import "oldTableViewController.h"
//
//#import "JSONKit.h"
//
//#import "SoundCloudTrack.h"
//
//
//@interface oldTableViewController ()
//
//@property (nonatomic,retain) AVAudioPlayer *audioPlayer;
//
//@end
//
//
//@implementation oldTableViewController
//
//
//- (id)initWithStyle:(UITableViewStyle)style
//
//{
//    
//    self = [super initWithStyle:UITableViewStylePlain];
//    
//    if (self) {
//        
//        // Custom initialization
//        
//    }
//    
//    return self;
//    
//}
//
//
//- (void)viewDidLoad
//
//{
//    
//    
//#define SC_API_URL @"https://api.soundcloud.com"
//    
//#define CLIENT_ID @"dfcb0ace5fb36fb38fc0705d8e80b98b"
//    
//    
//    self.SoundCloudTracksList = [[NSMutableArray alloc] init];
//    
//    
//    
//    NSString * query = @"hate it or love it";
//    
//    query = [query stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    
//    NSString *jsonString =[NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/tracks.json?client_id=%@&q=%@",SC_API_URL,CLIENT_ID,query]] encoding:NSUTF8StringEncoding error:nil];
//    
//    
//    
//    NSMutableArray *musicArray =[jsonString objectFromJSONString];
//    
//    
//    
//    for(int i=0; i< musicArray.count;i++)
//        
//    {
//        
//        NSMutableDictionary *result = [musicArray objectAtIndex:i];
//        
//        if([[result objectForKey:@"kind" ] isEqualToString:@"track"] &&
//           
//           [[result valueForKey:@"streamable"] boolValue])
//            
//        {
//            
//            SoundCloudTrack * soundCloudTrack = [[SoundCloudTrack alloc] init];
//            
//            soundCloudTrack.title = [result objectForKey:@"title"];
//            
//            
//            
//            /* If you want to input the username into the soundCloudTrack data,
//             
//             use this code, else, omit username from class SoundCloudTrack */
//            
//            NSMutableDictionary * user = [result objectForKey:@"user"];
//            
//            soundCloudTrack.username = [user objectForKey:@"username"];
//            
//            
//            
//            
//            
//            soundCloudTrack.ID = [NSString stringWithFormat:@"%@",[result objectForKey:@"id"]];
//            
//            soundCloudTrack.thumbnail = [result objectForKey:@"artwork_url"];
//            
//            
//            
//            NSLog(@"SoundCloudTrack to add to SoundCloudTracks list:\nTitle: %@ ID: %@\n\n", soundCloudTrack.title, soundCloudTrack.ID);
//            
//            
//            [self.SoundCloudTracksList addObject:soundCloudTrack];
//            
//        }
//        
//    }
//    
//    
//    
//    for (SoundCloudTrack *t in self.SoundCloudTracksList){
//        
//        NSLog(@"Title: %@ ID: %@\n\n", t.title, t.ID);
//        
//    }
//    
//    
//    
//}
//
//
//- (void)didReceiveMemoryWarning
//
//{
//    
//    [super didReceiveMemoryWarning];
//    
//    // Dispose of any resources that can be recreated.
//    
//}
//
//
//#pragma mark - Table view data source
//
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//
//{
//    
//    // Return the number of sections.
//    
//    return 1;
//    
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//
//{
//    
//    // Return the number of rows in the section.
//    
//    return [self.SoundCloudTracksList count];
//    
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    static NSString *CellIdentifier = @"SearchCell";
//    
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    
//    
//    SoundCloudTrack *soundCloudTrack = [self.SoundCloudTracksList objectAtIndex:indexPath.row];
//    
//    
//    
//    cell.imageView.image = [soundCloudTrack imageToDisplay];
//    
//    cell.textLabel.text = soundCloudTrack.title;
//    
//    cell.detailTextLabel.text = soundCloudTrack.username;
//    
//    cell.delegate = self;
//    
//    return cell;
//    
//}
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    SoundCloudTrack *soundCloudTrack = [self.SoundCloudTracksList objectAtIndex:indexPath.row];
//    
//    NSString *str = [NSString stringWithFormat: @"https://api.soundcloud.com/tracks/%@/stream", soundCloudTrack.ID];
//    
//    NSData *data =[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?client_id=%@",str, CLIENT_ID]]];
//    
//    self.audioPlayer = [[AVAudioPlayer alloc]initWithData:data error:nil];
//    
//    [self.audioPlayer play];
//    
//}
//
//
//@end
//
//
