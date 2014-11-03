//  SearchTVC.m
//  Bounce

#import "SearchTVC.h"
#import "SearchCell.h"

//NEW IMPORTS
#import <AVFoundation/AVFoundation.h>
#import "JSONKit.h"
#import "SoundCloudTrack.h"
#import "FriendsTVC.h"

@interface SearchTVC ()

@property (nonatomic,retain) AVAudioPlayer *audioPlayer;

@end

@implementation SearchTVC

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
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
{
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"SearchCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"SearchCell"];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.searchBar.tintColor = [UIColor colorWithRed:.13 green:.84 blue:.83 alpha:1.0];
    self.searchBar.barTintColor = [UIColor whiteColor];
    self.searchBar.backgroundColor = [UIColor grayColor];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    [self.tableView.tableHeaderView addSubview:self.searchBar];
    
    self.searchBar.placeholder = @"Search";
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.searchBar.delegate = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    //NSLog(@"ROW: %d\n", indexPath.row);
    static NSString *CellIdentifier = @"SearchCell";
    
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
       cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    SoundCloudTrack *soundCloudTrack = [self.SoundCloudTracksList objectAtIndex:indexPath.row];
    
    cell.albumArtView.image = [soundCloudTrack imageToDisplay];
    
    cell.trackName.text = soundCloudTrack.title;
    
    NSLog(@"OBJECT AT THIS INDEX PATH, TITLE: %@\n", soundCloudTrack.title);
    
    cell.userName.text = soundCloudTrack.username;
    
    cell.playButton.tag = indexPath.row;
    
    [cell.playButton addTarget:self action:@selector(playSong:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.continueButton.tag = indexPath.row;
    
    [cell.continueButton addTarget:self action:@selector(continueToFriends:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"Tag: %ld", cell.playButton.tag);
    
    NSLog(@"A cell is here!\n %@ %@\n",cell.trackName.text,cell.userName.text);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 91.0;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    self.SoundCloudTracksList = [[NSMutableArray alloc] init];
    
    NSString * query = searchBar.text;
    
    query = [query stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSString *jsonString =[NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/tracks.json?client_id=%@&q=%@",SC_API_URL,CLIENT_ID,query]] encoding:NSUTF8StringEncoding error:nil];    
    
    NSMutableArray *musicArray =[jsonString objectFromJSONString];
    
    
    
    for(int i=0; i< musicArray.count;i++)
        
    {
        
        NSMutableDictionary *result = [musicArray objectAtIndex:i];
        
        NSLog(@"Logging Result: %@\n", [result objectForKey:@"kind"]);
        
        if([[result objectForKey:@"kind" ] isEqualToString:@"track"]){//&&
           //NSLog(@"Logging Result: %@\n", [result objectForKey:@"streamable"]);
            if(([result objectForKey:@"streamable"] != [NSNull  null])
               && [[result valueForKey:@"streamable"] boolValue]){
            
            SoundCloudTrack * soundCloudTrack = [[SoundCloudTrack alloc] init];
            
            soundCloudTrack.title = [result objectForKey:@"title"];
            
            
            
            /* If you want to input the username into the soundCloudTrack data,
             
             use this code, else, omit username from class SoundCloudTrack */
            
            NSMutableDictionary * user = [result objectForKey:@"user"];
            
            soundCloudTrack.username = [user objectForKey:@"username"];
            
            
            
            
            
            soundCloudTrack.ID = [NSString stringWithFormat:@"%@",[result objectForKey:@"id"]];
            
            soundCloudTrack.thumbnail = [result objectForKey:@"artwork_url"];
            
            
            
            NSLog(@"SoundCloudTrack to add to SoundCloudTracks list:\nTitle: %@ ID: %@\n\n", soundCloudTrack.title, soundCloudTrack.ID);
            
            
            [self.SoundCloudTracksList addObject:soundCloudTrack];
            [self.tableView reloadData];
            
        }
            
            
        }
        
    }
    
    
    
    for (SoundCloudTrack *t in self.SoundCloudTracksList){
        
        NSLog(@"Title: %@ ID: %@\n\n", t.title, t.ID);
        
    }

}

- (void)playSong:(UIButton*) sender {
    
    NSLog(@"PLAY WAS PRESSED");
    
    SoundCloudTrack *soundCloudTrack = [self.SoundCloudTracksList objectAtIndex:sender.tag];
    
    NSString *str = [NSString stringWithFormat: @"https://api.soundcloud.com/tracks/%@/stream", soundCloudTrack.ID];
    
    NSData *data =[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?client_id=%@",str, CLIENT_ID]]];
    
    self.audioPlayer = [[AVAudioPlayer alloc]initWithData:data error:nil];
    
    //[self.audioPlayer prepareToPlay];
    
    [self.audioPlayer play];

}

- (void)continueToFriends:(UIButton *)sender
{
    NSLog(@"BounceButtonPressed");
    FriendsTVC *friendsTVC = [[FriendsTVC alloc] init];
    [self.navigationController pushViewController:friendsTVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
