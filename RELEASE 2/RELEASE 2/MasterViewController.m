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
    
    int segundosInt;
    int minutosInt;
    UIBarButtonItem *time;
    //Inicializar precios de cada material
    int prodPrice[3];
    
    int numMachine;
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
    [self playAll];
    machine1[0] =1;
    machine2[0] =1;
    machine3[0] =1;
    machine4[0] =1;
    machine5[0] =1;
    machine6[0] =1;
    machine7[0] =1;
    
    machine1[1] =100000;
    machine2[1] =100000;
    machine3[1] =100000;
    machine4[1] =100000;
    machine5[1] =100000;
    machine6[1] =100000;
    machine7[1] =100000;
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
            for (int x =1; x<11; x++)
            {
                machine1[x] =receivedInfoInt[x];
            }
            //Actualizar los materiales de entrada de la maquina siguiente con los materiales de salida de la maquina actual
            machine2[5] =machine1[8];
            machine2[6] =machine1[9];
            machine2[7] =machine1[10];
            //Actualiza dinero de todas las maquinas
            machine2[1]=machine1[1];
            machine3[1]=machine1[1];
            machine4[1]=machine1[1];
            machine5[1]=machine1[1];
            machine6[1]=machine1[1];
            machine7[1]=machine1[1];
            break;
        case 2:
<<<<<<< HEAD
            for (int x =1; x<11; x++)
=======
            for (int x =0; x<11; x++)
>>>>>>> FETCH_HEAD
            {
                machine2[x] =receivedInfoInt[x];
            }
            //Actualizar los materiales de entrada de la maquina siguiente con los materiales de salida de la maquina actual
            machine3[5] =machine2[8];
            machine3[6] =machine2[9];
            machine3[7] =machine2[10];
            break;
        case 3:
<<<<<<< HEAD
            for (int x =1; x<11; x++)
=======
            for (int x =0; x<11; x++)
>>>>>>> FETCH_HEAD
            {
                machine3[x] =receivedInfoInt[x];
            }
            //Actualizar los materiales de entrada de la maquina siguiente con los materiales de salida de la maquina actual
            machine4[5] =machine3[8];
            machine4[6] =machine3[9];
            machine4[7] =machine3[10];
            break;
        case 4:
<<<<<<< HEAD
            for (int x =1; x<11; x++)
=======
            for (int x =0; x<11; x++)
>>>>>>> FETCH_HEAD
            {
                machine4[x] =receivedInfoInt[x];
            }
            //Actualizar los materiales de entrada de la maquina siguiente con los materiales de salida de la maquina actual
            machine5[5] =machine4[8];
            machine5[6] =machine4[9];
            machine5[7] =machine4[10];
            break;
        case 5:
<<<<<<< HEAD
            for (int x =1; x<11; x++)
=======
            for (int x =0; x<11; x++)
>>>>>>> FETCH_HEAD
            {
                machine5[x] =receivedInfoInt[x];
            }
            //Actualizar los materiales de entrada de la maquina siguiente con los materiales de salida de la maquina actual
            machine6[5] =machine5[8];
            machine6[6] =machine5[9];
            machine6[7] =machine5[10];
            break;
        case 6:
<<<<<<< HEAD
            for (int x =1; x<11; x++)
=======
            for (int x =0; x<11; x++)
>>>>>>> FETCH_HEAD
            {
                machine6[x] =receivedInfoInt[x];
            }
            //Actualizar los materiales de entrada de la maquina siguiente con los materiales de salida de la maquina actual
            machine7[5] =machine6[8];
            machine7[6] =machine6[9];
            machine7[7] =machine6[10];
            break;
        case 7:
<<<<<<< HEAD
            for (int x =1; x<11; x++)
            {
                machine7[x] =receivedInfoInt[x];
            }
            machine1[1] = machine1[1] +(machine7[8] * prodPrice[0]) + (machine7[9] * prodPrice[1]) + (machine7[10] * prodPrice[1]);
            break;
=======
            for (int x =0; x<11; x++)
            {
                machine7[x] =receivedInfoInt[x];
            }
            break;
            machine1[1] = machine1[1] +(machine7[8] * prodPrice[0]) + (machine7[9] * prodPrice[1]) + (machine7[10] * prodPrice[1]);

>>>>>>> FETCH_HEAD


<<<<<<< HEAD
    }
    
    machine2[1]=machine1[1];
    machine3[1]=machine1[1];
    machine4[1]=machine1[1];
    machine5[1]=machine1[1];
    machine6[1]=machine1[1];
    machine7[1]=machine1[1];
=======
>>>>>>> FETCH_HEAD
    
    for (int x =8; x<11; x++)
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //Inicializar precios de cada material
    prodPrice[0]=7000;
    prodPrice[1]=4000;
    prodPrice[2]=10000;
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveDataWithNotification:)
                                                 name:@"MCDidReceiveDataNotification"
                                               object:nil];
    

    
    minuto = @"00";
    segundos = @"00";
    
    minutosInt = 0;
    segundosInt = 0;

    NSString *tiempo = [NSString stringWithFormat: @"%@:%@", minuto, segundos];
    UIBarButtonItem *play = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(playAll)];
    
    UIBarButtonItem *pause = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(pauseAll)];
    
    time = [[UIBarButtonItem alloc]initWithTitle:tiempo
                                    style:UIBarButtonItemStylePlain
                                   target:self
                                   action:nil];
    
        // asi se actualiza tiempo
    time.title = @"00:00";
    
    self.navigationItem.rightBarButtonItems =
    [NSArray arrayWithObjects:pause, play, time, nil];
    
    [self initMachines];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMachines:) userInfo:nil repeats:YES];
    
    [self createTimer];
    numMachine =0;
    
}

- (NSTimer*)createTimer {
    // create timer on run loop
    return [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTicked:) userInfo:nil repeats:YES];
    
}

- (void)timerTicked:(NSTimer*)timer {
    if (machine1[0] == 1) {
        segundosInt ++;
        
        if (segundosInt >= 60) {
            segundosInt = 0;
            minutosInt ++;
        }
        if (segundosInt <= 9)
            segundos = [NSString stringWithFormat: @"0%d", segundosInt];
        else
            segundos = [@(segundosInt) stringValue];
        if (minutosInt <= 9)
            minuto = [NSString stringWithFormat: @"0%d", minutosInt];
        else
            minuto = [@ (minutosInt) stringValue];
        
        NSString *tiempo = [NSString stringWithFormat: @"%@:%@", minuto, segundos];
        

        time.title = tiempo;
    }
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

        self.estadoMaquina1.image = [UIImage imageNamed:@"powerRed.png"];

    }
    else if (machine1[4] == 2) {

        self.estadoMaquina1.image = [UIImage imageNamed:@"powerGreen.png"];

    }
    else if (machine1[4] == 3) {

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
<<<<<<< HEAD
=======
    NSLog(encodedStringFinal);
>>>>>>> FETCH_HEAD
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
    
    machine1[0] =3;
    machine2[0] =3;
    machine3[0] =3;
    machine4[0] =3;
    machine5[0] =3;
    machine6[0] =3;
    machine7[0] =3;
    
    
}

- (IBAction)verDetalle1:(id)sender {
    numMachine =1;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
    
>>>>>>> FETCH_HEAD
}

- (IBAction)verDetalle2:(id)sender {
    numMachine =2;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
>>>>>>> FETCH_HEAD
}

- (IBAction)verDetalle3:(id)sender {
    numMachine =3;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
>>>>>>> FETCH_HEAD
}

- (IBAction)verDetalle4:(id)sender {
    numMachine =4;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
>>>>>>> FETCH_HEAD
}

- (IBAction)verDetalle5:(id)sender {
    numMachine =5;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
>>>>>>> FETCH_HEAD
}

- (IBAction)verDetalle6:(id)sender {
    numMachine =6;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
>>>>>>> FETCH_HEAD
}

- (IBAction)verDetalle7:(id)sender {
    numMachine =7;
<<<<<<< HEAD
    [self performSegueWithIdentifier: @"adminAMaquina" sender: self];
=======
>>>>>>> FETCH_HEAD
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"adminAMaquina"]) {
        
        NSDictionary *toDetail = [[NSDictionary alloc] initWithObjectsAndKeys:[@(numMachine) stringValue],@"numMachine",[@(minutosInt) stringValue], @"minutosInt",[@(segundosInt) stringValue],@"segundosInt", nil];
        [[segue destinationViewController] setDatos:toDetail];

    }
}


@end
