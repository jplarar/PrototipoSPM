//
//  DetailViewController.m
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()
{
    

    int segundosInt;
    int minutosInt;
    
    int machine1[11];
    int machine2[11];
    int machine3[11];
    int machine4[11];
    int machine5[11];
    int machine6[11];
    int machine7[11];
    

}


@property (nonatomic, strong) AppDelegate *appDelegate;


@end

@implementation DetailViewController

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
            self.segundosTotalLabel.text = [NSString stringWithFormat: @"0%d", segundosInt];
        else
            self.segundosTotalLabel.text = [@(segundosInt) stringValue];
        if (minutosInt <= 9)
            self.minutosTotalLabel.text = [NSString stringWithFormat: @"0%d", minutosInt];
        else
            self.minutosTotalLabel.text = [@ (minutosInt) stringValue];

    }
}

-(void)didReceiveDataWithNotification:(NSNotification *)notification
{

    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    
    NSData *receivedData = [[notification userInfo] objectForKey:@"data"];
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    [self decodeStringReceived:receivedText];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initMachines];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveDataWithNotification:)
                                                 name:@"MCDidReceiveDataNotification"
                                               object:nil];
    
    self.numMachine = [[self.datos valueForKey:@"numMachine"] intValue];
    segundosInt = [[self.datos valueForKey:@"segundosInt"] intValue];
    minutosInt = [[self.datos valueForKey:@"minutosInt"] intValue];
    
    self.numeroMaquinaLabel.text = [self.datos valueForKey:@"numMachine"];
    
    [self createTimer];
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    switch (self.numMachine) {
        case 1:
            self.dineroLabel.text = [@(machine1[1]) stringValue];
            if (machine1[4]==1)
            {
                [self.estadoMaquina setImage:[UIImage imageNamed:@"powerGreen.png"] forState:UIControlStateNormal ];
                self.estadoMaquinaLabel.text =@"Encendida";
            }
            else if (machine1[4]==2){
                [self.estadoMaquina setImage:[UIImage imageNamed:@"powerRed.png"] forState:UIControlStateNormal ];
                 self.estadoMaquinaLabel.text =@"Apagada";
            }
            else if (machine1[4]==3){
                [self.estadoMaquina setImage:[UIImage imageNamed:@"powerYellow.png"] forState:UIControlStateNormal ];
                 self.estadoMaquinaLabel.text =@"Ajustando";
            }

            self.minutosAjusteLabel.text = @"00";
            self.segundosAjusteLabel.text = @"00";
            break;

            
            
    }
    
    
    
    
    
    
}
-(void) setDatos:(id)datos
{
    _datos = datos;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
