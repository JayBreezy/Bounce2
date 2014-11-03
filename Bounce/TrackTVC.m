//  TrackTVC.m
//  Bounce

#import "TrackTVC.h"
#import "JSONKit.h"
#import "TrackTableViewCell.h"
#import "SoundCloudTrack.h"

NSString * receiverID = @"545133ff4a82b5e43b000003";

@interface TrackTVC ()

@end

@implementation TrackTVC

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    //temporary, just testing
    if (self) {
        self.navigationItem.title = @"bounce";
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
/////HERE, MUST SAVE USER WHO SENT SONG AS PART OF TRACK

{
    [super viewDidLoad];
    self.SoundCloudTracksList = [[NSMutableArray alloc] init];
    
    UINib *nib = [UINib nibWithNibName:@"TrackTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TrackTableViewCell"];
    
//    NSString *bounceIDsString =[NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://bounceapi.ngrok.com/api/users/%@/bounces/received",receiverID]] encoding:NSUTF8StringEncoding error:nil];
//    
//    NSMutableArray * arrayOfBounceIDs = [bounceIDsString objectFromJSONString];
//    
//    for (int i = 0; i<arrayOfBounceIDs.count; i++){
//        NSLog(@"Bounce ID: %@",arrayOfBounceIDs[i]);//GOOD
//        
//        NSString *bounceObjectsString =[NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://bounceapi.ngrok.com/api/bounces/%@",arrayOfBounceIDs[i]]] encoding:NSUTF8StringEncoding error:nil];
//        
//        
//        NSMutableDictionary * bounceObject = [bounceObjectsString objectFromJSONString];
//        NSLog(@"NSLOG OF BOUNCE OBJECT, OBJECT FOR KEY : %@", [bounceObject objectForKey:@"song"]);
//
//        NSString * SenderOfSongID = [bounceObject objectForKey:@"from"];
        
//        NSString * SendersIDString = [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://bounceapi.ngrok.com/api/users/%@/",SenderOfSongID]] encoding:NSUTF8StringEncoding error:nil];
//        NSDictionary * SenderOfSong = [SendersIDString objectFromJSONString];
//        NSString * SendersUsername = [SenderOfSong objectForKey:@"username"];
//
//        
//        NSString *trackIDinJSON = [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://bounceapi.ngrok.com/api/songs/%@",[bounceObject objectForKey:@"song"]]] encoding:NSUTF8StringEncoding error:nil];
//        NSDictionary * trackDict = [trackIDinJSON objectFromJSONString];
    
//    NSString * trackID = [trackDict objectForKey:@"soundcloud_id"];

    
        //here set ID to 152171622, 146709958
    
    //
    
    NSArray * trackIDs = @[@"152171622",@"146709958"];
    
    for (NSString * TrackIDString in trackIDs){
        SoundCloudTrack * track = [[SoundCloudTrack alloc] init];
        //track.senderOfSong = SendersUsername;
        track.ID = TrackIDString;
        NSLog(@"Track ID is: %@\n", track.ID);
        [self.SoundCloudTracksList addObject:track];
    }
    

        [self processTracks];
    
    
//     Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
//    
//     Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)processTracks
{
    for (SoundCloudTrack * t in self.SoundCloudTracksList){
        
        NSString *jsonString =[NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/tracks/%@.json?client_id=%@",SC_API_URL,t.ID,CLIENT_ID]] encoding:NSUTF8StringEncoding error:nil];
        NSMutableDictionary * songDictionary = [jsonString objectFromJSONString];
        //NSLog(@"%@",jsonString);
        t.title = [songDictionary objectForKey:@"title"]; NSLog(@"Title of song: %@", t.title);
        t.thumbnail = [songDictionary objectForKey:@"artwork_url"];
        NSMutableDictionary * user = [songDictionary objectForKey:@"user"];
        t.username = [user objectForKey:@"username"];
        NSLog(@"\n%@ %@ %@", t.title, t.thumbnail, t.username);
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.SoundCloudTracksList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrackTableViewCell"
                                                               forIndexPath:indexPath];

    if (!cell) {
        cell = [[TrackTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TrackTableViewCell"];
        
    
    }
    
//    cell.albumArtImageView.image = [UIImage imageNamed:@"Nickelgraph.jpg"];
//    cell.nameLabel.text = @"Photograph";
//    cell.artistLabel.text = @"Nickelback";
//    cell.isFromLabel.text = @"nickelbackFan81";
    
    SoundCloudTrack *soundCloudTrack = [self.SoundCloudTracksList objectAtIndex:indexPath.row];
    
    cell.albumArtImageView.image  = [soundCloudTrack imageToDisplay];
    
    cell.nameLabel.text = soundCloudTrack.title;
    
    cell.artistLabel.text = soundCloudTrack.username;
    
    cell.likeButton.tag = indexPath.row;
    
    cell.bounceButton.tag = indexPath.row;
    
    [cell.likeButton addTarget:self action:@selector(likeSong:) forControlEvents:UIControlEventTouchUpInside];

    [cell.bounceButton addTarget:self action:@selector(bounceSong:) forControlEvents:UIControlEventTouchUpInside];
//
   return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 91.0;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)likeSong:(UIButton *)sender
{
    NSLog(@"Liked song");
}

- (void)bounceSong:(UIButton *)sender
{

}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
