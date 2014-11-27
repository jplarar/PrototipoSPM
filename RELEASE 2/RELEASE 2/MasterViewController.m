//
//  MasterViewController.m
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "MasterViewController.h"
#import "AppDelegate.h"

@interface MasterViewController ()
{
    NSString *minuto;
    NSString *segundos;
    int machine1[11];
    int machine2[11];
    int machine3[11];
    int machine4[11];
    int machine5[11];
    int machine6[11];
    int machine7[11];
    
}
    
@property (nonatomic, strong) AppDelegate *appDelegate;

-(void)didReceiveDataWithNotification:(NSNotification *)notification;


@end

@implementation MasterViewController

-(void)initMachines
{
 
    for (int x =0; x<11; x++)
    {
        machine1[x] =0;
        machine2[x] =0;
        machine3[x] =0;
        machine4[x] =0;
        machine5[x] =0;
        machine6[x] =0;
        machine7[x] =0;

    }
}

-(void)decodeStringReceived:(NSString *)receivedInfo
{
    /*
     Pos0 = @"state" 1=Play; 2=Pause; 3=Stop,
     Pos1 =@"money",
     Pos2 =@"machine",
     Pos3 =@"currentMaterial" 1=Circulo; 2=Cuadrado; 3=Triangulo,
     Pos4 =@"power" 1=Off; 2=On; 3=Adjusting,
     Pos5 =@"materialInCirculo1",
     Pos6 =@"materialInCuadrado2",
     Pos7 =@"materialInTriangulo3",
     Pos8 =@"materialOutCirculo1",
     Pos9 =@"materialOutCuadrado2",
     Pos10 =@"materialOutTriangulo3",
     */


    NSArray *myReceivedInfo= [receivedInfo componentsSeparatedByString:@"_"];
    int receivedInfoInt[11];
    
    for (int x=0; x < 11; x++)
        receivedInfoInt[x] = [myReceivedInfo[x] intValue];
    
    
    switch (receivedInfoInt[2]) {
        case 1:
            for (int x =0; x<11; x++)
            {
                machine1[x] =receivedInfoInt[x];
            }
            break;
        case 2:
            for (int x =0; x<11; x++)
            {
                machine2[x] =receivedInfoInt[x];
            }
            break;
        case 3:
            for (int x =0; x<11; x++)
            {
                machine3[x] =receivedInfoInt[x];
            }
            break;
        case 4:
            for (int x =0; x<11; x++)
            {
                machine4[x] =receivedInfoInt[x];
            }
            break;
        case 5:
            for (int x =0; x<11; x++)
            {
                machine5[x] =receivedInfoInt[x];
            }
            break;
        case 6:
            for (int x =0; x<11; x++)
            {
                machine6[x] =receivedInfoInt[x];
            }
            break;
        case 7:
            for (int x =0; x<11; x++)
            {
                machine7[x] =receivedInfoInt[x];
            }
            break;

    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveDataWithNotification:)
                                                 name:@"MCDidReceiveDataNotification"
                                               object:nil];
    

    
    minuto = @"00";
    segundos = @"00";

    NSString *tiempo = [NSString stringWithFormat: @"%@:%@", minuto, segundos];
    UIBarButtonItem *play = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(playAll:)];
    
    UIBarButtonItem *pause = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(pauseAll:)];
    
    UIBarButtonItem *time = [[UIBarButtonItem alloc]initWithTitle:tiempo
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:nil];
    // asi se actualiza tiempo
    time.title = @"hola";
    
    self.navigationItem.rightBarButtonItems =
    [NSArray arrayWithObjects:pause, play, time, nil];
    
    [self initMachines];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMachines:) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 7;
}

-(IBAction)unWindMasterController:(UIStoryboardSegue *)segue
{
    
}

-(void) playAll{
    machine1[0] =1;
    machine2[0] =1;
    machine3[0] =1;
    machine4[0] =1;
    machine5[0] =1;
    machine6[0] =1;
    machine7[0] =1;

    
}

-(void) pauseAll {
    machine1[0]=2;
    machine2[0] =2;
    machine3[0] =2;
    machine4[0] =2;
    machine5[0] =2;
    machine6[0] =2;
    machine7[0] =2;
    
}

- (void)updateMachines:(NSTimer*)timer {
    NSLog(@"%d",machine1[4]);

    /*
     Pos0 = @"state" 1=Play; 2=Pause; 3=Stop,
     Pos1 =@"money",
     Pos2 =@"machine",
     Pos3 =@"materialActual" 1=Circulo; 2=Cuadrado; 3=Triangulo,
     Pos4 =@"power" 1=Off; 2=On; 3=Adjusting,
     Pos5 =@"materialInCirculo1",
     Pos6 =@"materialInCuadrado2",
     Pos7 =@"materialInTriangulo3",
     Pos8 =@"materialOutCirculo1",
     Pos9 =@"materialOutCuadrado2",
     Pos10 =@"materialOutTriangulo3",
     */

    if(machine1[4] == 1) {
        NSLog(@"si entrooooo");
        self.estadoMaquina1.image = [UIImage imageNamed:@"powerRed.png"];

    }
    else if (machine1[4] == 2) {
        NSLog(@"si entrooooo");

        self.estadoMaquina1.image = [UIImage imageNamed:@"powerGreen.png"];

    }
    else if (machine1[4] == 3) {
        NSLog(@"si entrooooo");

        self.estadoMaquina1.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    if(machine2[4] == 1) {
        self.estadoMaquina2.image = [UIImage imageNamed:@"powerRed.png"];
        
    }
    else if (machine2[4] == 2) {
        self.estadoMaquina2.image = [UIImage imageNamed:@"powerGreen.png"];
        
    }
    else if (machine2[4] == 3) {
        self.estadoMaquina2.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    if(machine3[4] == 1) {
        self.estadoMaquina3.image = [UIImage imageNamed:@"powerRed.png"];
        
    }
    else if (machine3[4] == 2) {
        self.estadoMaquina3.image = [UIImage imageNamed:@"powerGreen.png"];
        
    }
    else if (machine3[4] == 3) {
        self.estadoMaquina3.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    if(machine4[4] == 1) {
        self.estadoMaquina4.image = [UIImage imageNamed:@"powerRed.png"];
        
    }
    else if (machine4[4] == 2) {
        self.estadoMaquina4.image = [UIImage imageNamed:@"powerGreen.png"];
        
    }
    else if (machine4[4] == 3) {
        self.estadoMaquina4.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    if(machine5[4] == 1) {
        self.estadoMaquina5.image = [UIImage imageNamed:@"powerRed.png"];
        
    }
    else if (machine5[4] == 2) {
        self.estadoMaquina5.image = [UIImage imageNamed:@"powerGreen.png"];
        
    }
    else if (machine5[4] == 3) {
        self.estadoMaquina5.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    if(machine6[4] == 1) {
        self.estadoMaquina6.image = [UIImage imageNamed:@"powerRed.png"];
        
    }
    else if (machine6[4] == 2) {
        self.estadoMaquina6.image = [UIImage imageNamed:@"powerGreen.png"];
        
    }
    else if (machine6[4] == 3) {
        self.estadoMaquina6.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    if(machine7[4] == 1) {
        self.estadoMaquina7.image = [UIImage imageNamed:@"powerRed.png"];
        
    }
    else if (machine7[4] == 2) {
        self.estadoMaquina7.image = [UIImage imageNamed:@"powerGreen.png"];
        
    }
    else if (machine7[4] == 3) {
        self.estadoMaquina7.image = [UIImage imageNamed:@"powerYellow.png"];
        
    }
    
    
    
    
    
    //--------------------------------
    
    
    
    if(machine1[3] == 1) {
        self.materialMaquina1.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine1[3] == 2) {
        self.materialMaquina1.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine1[3] == 3) {
        self.materialMaquina1.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    
    
    if(machine2[3] == 1) {
        self.materialMaquina2.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine2[3] == 2) {
        self.materialMaquina2.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine2[3] == 3) {
        self.materialMaquina2.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    
    
    if(machine3[3] == 1) {
        self.materialMaquina3.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine3[3] == 2) {
        self.materialMaquina3.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine3[3] == 3) {
        self.materialMaquina3.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    
    
    
    if(machine4[3] == 1) {
        self.materialMaquina4.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine4[3] == 2) {
        self.materialMaquina4.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine4[3] == 3) {
        self.materialMaquina4.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    
    
    
    if(machine5[3] == 1) {
        self.materialMaquina5.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine5[3] == 2) {
        self.materialMaquina5.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine5[3] == 3) {
        self.materialMaquina5.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    
    
    
    if(machine6[3] == 1) {
        self.materialMaquina6.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine6[3] == 2) {
        self.materialMaquina6.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine6[3] == 3) {
        self.materialMaquina6.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    
    
    if(machine7[3] == 1) {
        self.materialMaquina7.image = [UIImage imageNamed:@"circleGreen.png"];
        
    }
    else if (machine7[3] == 2) {
        self.materialMaquina7.image = [UIImage imageNamed:@"squareGreen.png"];
        
    }
    else if (machine7[3] == 3) {
        self.materialMaquina7.image = [UIImage imageNamed:@"triangleGreen.png"];
        
    }
    [self encodeStringToSend];
}

-(void)encodeStringToSend
{
    NSString *myInfoStr;
    NSString *encodedString1= @"";
    NSString *encodedString2= @"";
    NSString *encodedString3= @"";
    NSString *encodedString4= @"";
    NSString *encodedString5= @"";
    NSString *encodedString6= @"";
    NSString *encodedString7= @"";

    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine1[x]];
        encodedString1 = [encodedString1 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString1 = [encodedString1 stringByAppendingString:@"_"];
    }
    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine2[x]];
        encodedString2 = [encodedString2 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString2 = [encodedString2 stringByAppendingString:@"_"];
    }

    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine3[x]];
        encodedString3 = [encodedString3 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString3 = [encodedString3 stringByAppendingString:@"_"];
    }

    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine4[x]];
        encodedString4 = [encodedString4 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString4 = [encodedString4 stringByAppendingString:@"_"];
    }

    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine5[x]];
        encodedString5 = [encodedString5 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString5 = [encodedString5 stringByAppendingString:@"_"];
    }

    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine6[x]];
        encodedString6 = [encodedString6 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString6 = [encodedString6 stringByAppendingString:@"_"];
    }

    for (int x=0; x < 11; x++)
    {
        myInfoStr = [NSString stringWithFormat:@"%d", machine7[x]];
        encodedString7 = [encodedString7 stringByAppendingString:myInfoStr];
        if(x!=10)
            encodedString7 = [encodedString7 stringByAppendingString:@"_"];
    }
    
    NSString *encodedStringFinal =@"";
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString1];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:@"/"];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString2];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:@"/"];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString3];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:@"/"];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString4];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:@"/"];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString5];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:@"/"];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString6];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:@"/"];
    encodedStringFinal = [encodedStringFinal stringByAppendingString:encodedString7];

    [self sendMyMessage:encodedStringFinal];
}

-(void)sendMyMessage:(NSString *)stringToSend
{
    NSData *dataToSend = [stringToSend dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *allPeers = self.appDelegate.mcManager.session.connectedPeers;
    NSError *error;
    
    
    
    [self.appDelegate.mcManager.session sendData:dataToSend
                                         toPeers:allPeers
                                        withMode:MCSessionSendDataReliable
                                           error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
}

-(void)didReceiveDataWithNotification:(NSNotification *)notification{

    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    
    NSData *receivedData = [[notification userInfo] objectForKey:@"data"];
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    [self decodeStringReceived:receivedText];
    
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

- (IBAction)stopAll:(id)sender {
    
    machine1[0]=3;
    machine2[0] =3;
    machine3[0] =3;
    machine4[0] =3;
    machine5[0] =3;
    machine6[0] =3;
    machine7[0] =3;
}
@end
