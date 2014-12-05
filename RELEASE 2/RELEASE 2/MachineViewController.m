//
//  MachineViewController.m
//  RELEASE 2
//
//  Created by alumno on 26/11/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "MachineViewController.h"

@interface MachineViewController ()
{
    
    int myInfo[11];
    int onAdjustTime[7];
    int onProdCircle[7];
    int onProdSquare[7];
    int onProdTriangle[7];
    int materialPrice[3];
    /*
     Pos0 = @"state" 1=Play; 2=Pause; 3=Stop,
     Pos1 =@"money",
     Pos2 =@"machine",
     Pos3 =@"materialActual" 1=Circulo; 2=Cuadrado; 3=Triangulo,
     Pos4 =@"power" 1=On; 2=Off; 3=Adjusting,
     Pos5 =@"materialInCirculo1",
     Pos6 =@"materialInCuadrado2",
     Pos7 =@"materialInTriangulo3",
     Pos8 =@"materialOutCirculo1",
     Pos9 =@"materialOutCuadrado2",
     Pos10 =@"materialOutTriangulo3",
     */
    int segundos;
    int minutos;
    int contadorProd;
    int numMachine;
    
}
@end

@implementation MachineViewController

-(void) setNumMachine:(int)num {
    _numMachine = num;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    numMachine = self.numMachine;
    self.numeroMaquinaLabel.text = [NSString stringWithFormat:@"0%d", numMachine];
    // Do any additional setup after loading the view.
    myInfo[0] = 1;
    myInfo[1] = 100000;
    myInfo[2] = numMachine;
    myInfo[3] = 0;
    myInfo[4] = 2;
    myInfo[5] = 0;
    myInfo[6] = 0;
    myInfo[7] = 0;
    myInfo[8] = 0;
    myInfo[9] = 0;
    myInfo[10] = 0;
    
    //inicializador de dinero
    myInfo[1]=100000;
    self.dineroLabel.text = [@(myInfo[1]) stringValue];
    // inicia contador
    segundos = 0;
    minutos = 0;
    
    //inicializador de state
    myInfo[0] = 1;
    //inicializador de power
    myInfo[4] = 1;
    
    //inicializador de adjustime de todas las maquinas
    onAdjustTime[0]=5;
    onAdjustTime[1]=10;
    onAdjustTime[2]=3;
    onAdjustTime[3]=7;
    onAdjustTime[4]=4;
    onAdjustTime[5]=6;
    onAdjustTime[6]=2;
    
    //inicializador de tiempo de produccion de piezas circulo para todos las maquinas
    onProdCircle[0]=2;
    onProdCircle[1]=7;
    onProdCircle[2]=3;
    onProdCircle[3]=7;
    onProdCircle[4]=6;
    onProdCircle[5]=2;
    onProdCircle[6]=5;
    
    //inicializador de tiempo de produccion de piezas cuadrado para todos las maquinas
    onProdSquare[0]=5;
    onProdSquare[1]=1;
    onProdSquare[2]=9;
    onProdSquare[3]=3;
    onProdSquare[4]=7;
    onProdSquare[5]=4;
    onProdSquare[6]=3;
    
    //inicializador de tiempo de produccion de piezas triangulo para todos las maquinas
    onProdTriangle[0]=1;
    onProdTriangle[1]=5;
    onProdTriangle[2]=4;
    onProdTriangle[3]=3;
    onProdTriangle[4]=2;
    onProdTriangle[5]=1;
    onProdTriangle[5]=8;
    
    //Inicializar precios de cada material
    materialPrice[0]=5000;
    materialPrice[1]=7000;
    materialPrice[2]=2500;
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveDataWithNotification:)
                                                 name:@"MCDidReceiveDataNotification"
                                               object:nil];
    
    
    
    for (int x=0; x < (sizeof myInfo/sizeof(int)); x++)
    {
        if(x == (numMachine-1))
        {
            //Inicializacion de variables estaticas
            
            //Tiempo de Ajuste De La Maquina
            self.minutosAjusteLabel.text = [self convertIntTimeToStringTime:onAdjustTime[x]];
            self.segundosAjusteLabel.text = @"00";
            
            //Tiempo de Ajuste del Tipo de Material Circulo
            self.minutosCirculoLabel.text = [self convertIntTimeToStringTime:onProdCircle[x]];
            self.segundosCirculoLabel.text = @"00";
            
            //Tiempo de Ajuste del Tipo de Material Cuadrado
            self.minutosCuadradoLabel.text = [self convertIntTimeToStringTime:onProdSquare[x]];
            self.segundosCuadradoLabel.text = @"00";
            
            //Tiempo de Ajuste del Tipo de Material Triangulo
            self.minutosTrianguloLabel.text = [self convertIntTimeToStringTime:onProdTriangle[x]];
            self.segundosTrianguloLabel.text = @"00";
        }
    }
    
    //Deshabilitar compra de materiales si no es la maquina1
    if (numMachine >1)
    {
        self.agregarCirculo.hidden = YES;
        self.agregarCuadrado.hidden = YES;
        self.agregarTriangulo.hidden = YES;
    }
    
    contadorProd = 0;
    [self createTimer];

}



-(NSString *)convertIntTimeToStringTime: (int) intTime
{
    NSString *strTime;
    if(intTime <10)
    {
        strTime=[NSString stringWithFormat:@"0%d", intTime];
    }
    else
    {
       strTime=[NSString stringWithFormat:@"%d", intTime];
    }
    return strTime;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSTimer*)createTimer {
    // create timer on run loop
    return [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTicked:) userInfo:nil repeats:YES];
    
}

- (void)timerTicked:(NSTimer*)timer {
    [self sendMyMessage];
    if (myInfo[0] == 3){
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self performSegueWithIdentifier: @"finJuego" sender: self];
        });
    }
    if (myInfo[0] == 1) {
        [self checkMaterialProduction];
        segundos ++;
        
        if (segundos >= 60) {
            segundos = 0;
            minutos ++;
        }
        if (segundos <= 9)
            self.segundosTotalLabel.text = [NSString stringWithFormat: @"0%d", segundos];
        else
            self.segundosTotalLabel.text = [@(segundos) stringValue];
        if (minutos <= 9)
            self.minutosTotalLabel.text = [NSString stringWithFormat: @"0%d", minutos];
        else
            self.minutosTotalLabel.text = [@ (minutos) stringValue];
    }
}


-(void)decodeStringReceived:(NSString *)receivedInfo
{
    NSArray *machinesInfo = [receivedInfo componentsSeparatedByString:@"/"];
    NSArray *myReceivedInfo= [machinesInfo[numMachine-1] componentsSeparatedByString:@"_"];

    
    myInfo[0] = [myReceivedInfo[0] intValue];
    myInfo[1] = [myReceivedInfo[1] intValue];
    self.dineroLabel.text = [@(myInfo[1]) stringValue];

    if(numMachine >1)
    {
        myInfo[5] = [myReceivedInfo[5] intValue];
        self.entradaCirculoLabel.text = [@(myInfo[5]) stringValue];
        myInfo[6] = [myReceivedInfo[6] intValue];
        self.entradaCuadradoLabel.text = [@(myInfo[6]) stringValue];
        myInfo[7] = [myReceivedInfo[7] intValue];
        self.entradaTrianguloLabel.text = [@(myInfo[7]) stringValue];

    }


    [self update];
    
    
}
-(NSString *)encodeStringToSend
{
    NSString *myInfoStr[11];
    NSString *encodedString = @"";
    
    for (int x=0; x < (sizeof myInfo/sizeof(int)); x++)
    {
        myInfoStr[x] = [NSString stringWithFormat:@"%d", myInfo[x]];
        encodedString = [encodedString stringByAppendingString:myInfoStr[x]];
        if(x!=(sizeof myInfo/sizeof(int) -1))
            encodedString = [encodedString stringByAppendingString:@"_"];
    }
    return encodedString;
}

-(void)update
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

self.dineroLabel.text = [@(myInfo[1]) stringValue];
self.entradaCirculoLabel.text = [@(myInfo[5]) stringValue];
self.entradaCuadradoLabel.text = [@(myInfo[6]) stringValue];
self.entradaTrianguloLabel.text = [@(myInfo[7]) stringValue];


}
- (IBAction)agregarCirculo:(id)sender
{
    //Agregar material circulo
    if (myInfo[0] == 1){
        
        myInfo[5]++;
        myInfo[1]= myInfo[1]-materialPrice[0];
        self.entradaCirculoLabel.text = [@(myInfo[5]) stringValue];
        self.dineroLabel.text = [@(myInfo[1]) stringValue];
        if (myInfo[1]<0)
            self.dineroLabel.textColor = [UIColor redColor];
    }

}
- (IBAction)agregarCuadrado:(id)sender
{
    //Agregar material cuadrado
    if (myInfo[0] == 1 ){
        myInfo[6]++;
        myInfo[1]= myInfo[1]-materialPrice[1];
        self.entradaCuadradoLabel.text = [@(myInfo[6]) stringValue];
        self.dineroLabel.text = [@(myInfo[1]) stringValue];
        if (myInfo[1]<0)
            self.dineroLabel.textColor = [UIColor redColor];
    }

}
- (IBAction)agregarTriangulo:(id)sender
{
    //Agregar materialTriangulo
    if (myInfo[0] == 1){
        myInfo[7]++;
        myInfo[1]= myInfo[1]-materialPrice[2];
        self.entradaTrianguloLabel.text = [@(myInfo[7]) stringValue];
        self.dineroLabel.text = [@(myInfo[1]) stringValue];
        if (myInfo[1]<0)
            self.dineroLabel.textColor = [UIColor redColor];
    }
}


- (IBAction)selectCirculoButton:(id)sender
{
    if (myInfo[0] == 1 && myInfo[4] ==2){
        //Cambiar power a Ajustando
        myInfo[4]=3;
        [self.power setImage:[UIImage imageNamed:@"powerYellow.png"] forState:UIControlStateNormal ];
        self.estadoLabel.text=@"Ajustando";
        contadorProd = 0;
        //Cambiar color a amarillo para regresarle feedback al usuario
        [sender setImage:[UIImage imageNamed:@"circleYellow.png"] forState:UIControlStateNormal];
        [self.square setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
        [self.triangle setImage:[UIImage imageNamed:@"triangle.png"] forState:UIControlStateNormal];
        

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, onAdjustTime[numMachine -1] * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            myInfo[3]=1;
            //Cambiar power a Encendido
            myInfo[4]=2;
            self.estadoLabel.text=@"Encendido";
            //Actualizar imagen de material seleccionado
            [sender setImage:[UIImage imageNamed:@"circleGreen.png"] forState:UIControlStateNormal];
            [self.power setImage:[UIImage imageNamed:@"powerGreen.png"] forState:UIControlStateNormal];
          
        });
    }
}
- (IBAction)selectCuadradoButton:(id)sender
{
    if (myInfo[0] == 1 && myInfo[4] ==2){
        //Cambiar power a Ajustando
        myInfo[4]=3;
        [self.power setImage:[UIImage imageNamed:@"powerYellow.png"] forState:UIControlStateNormal ];
        self.estadoLabel.text=@"Ajustando";
        contadorProd = 0;
        //Cambiar color a amarillo para regresarle feedback al usuario
        [sender setImage:[UIImage imageNamed:@"squareYellow.png"] forState:UIControlStateNormal];
        [self.circle setImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        [self.triangle setImage:[UIImage imageNamed:@"triangle.png"] forState:UIControlStateNormal];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, onAdjustTime[numMachine -1] * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            myInfo[3]=2;
            //Cambiar power a Encendido
            myInfo[4]=2;
            self.estadoLabel.text=@"Encendido";
            //Actualizar imagen de material seleccionado
            [sender setImage:[UIImage imageNamed:@"squareGreen.png"] forState:UIControlStateNormal];
            [self.power setImage:[UIImage imageNamed:@"powerGreen.png"] forState:UIControlStateNormal];
        });

    }

}
- (IBAction)selectTrianguloLabel:(id)sender
{
    if (myInfo[0] == 1 && myInfo[4] == 2){
        //Cambiar power a Ajustando
        myInfo[4]=3;
        [self.power setImage:[UIImage imageNamed:@"powerYellow.png"] forState:UIControlStateNormal ];
        self.estadoLabel.text=@"Ajustando";
        contadorProd = 0;
        //Cambiar color a amarillo para regresarle feedback al usuario
        [sender setImage:[UIImage imageNamed:@"triangleYellow.png"] forState:UIControlStateNormal];
        [self.circle setImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        [self.square setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, onAdjustTime[numMachine -1] * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            myInfo[3]=3;
            //Cambiar power a Encendido
            myInfo[4]=2;
            self.estadoLabel.text=@"Encendido";
            //Actualizar imagen de material seleccionado
            [sender setImage:[UIImage imageNamed:@"triangleGreen.png"] forState:UIControlStateNormal];
            [self.power setImage:[UIImage imageNamed:@"powerGreen.png"] forState:UIControlStateNormal];

        });

    }
}
- (IBAction)changePowerButton:(id)sender
{
    if (myInfo[0] == 1){
 //   Pos4 =@"power" 1=Off; 2=On; 3=Adjusting,
        //Cambio de On a Off
        if (myInfo[4]==2)
        {
            myInfo[4]=1;
            //Actualizar imagen de estado seleccionado
            [sender setImage:[UIImage imageNamed:@"powerRed.png"] forState:UIControlStateNormal];
            self.estadoLabel.text=@"Apagada";
        }
        //Cambio de Off a Adjusting and then to On
        else if (myInfo[4]==1)
        {
            myInfo[4]=3;
            self.estadoLabel.text=@"Ajustando";
            //Actualizar imagen de estado seleccionado
            [sender setImage:[UIImage imageNamed:@"powerYellow.png"] forState:UIControlStateNormal ];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, onAdjustTime[numMachine -1] * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [sender setImage:[UIImage imageNamed:@"powerGreen.png"] forState:UIControlStateNormal ];
                myInfo[4]=2;
                self.estadoLabel.text=@"Encendida";
            });

        }
    }
    
}
-(void) checkMaterialProduction
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

    if (myInfo[0] == 1 && myInfo[4]==2) {
        contadorProd++;
        switch (myInfo[3]) {
            case 1:
                if (contadorProd == onProdCircle[numMachine-1] && myInfo[5] > 0) {
                    myInfo[8]++;
                    contadorProd = 0;
                    myInfo[5]--;
                    self.entradaCirculoLabel.text = [@(myInfo[5]) stringValue];
                    if (myInfo[1]>0)
                        self.dineroLabel.textColor = [UIColor blackColor];
                }
                break;
            case 2:
                if (contadorProd == onProdSquare[numMachine-1] && myInfo[6] > 0) {
                    myInfo[9]++;
                    contadorProd = 0;
                    myInfo[6]--;
                    self.entradaCuadradoLabel.text = [@(myInfo[6]) stringValue];
                    if (myInfo[1]>0)
                        self.dineroLabel.textColor = [UIColor blackColor];
                }
                break;
            case 3:
                if (contadorProd == onProdTriangle[numMachine-1] && myInfo[7] > 0) {
                    myInfo[10]++;
                    contadorProd = 0;
                    myInfo[7]--;
                    self.entradaTrianguloLabel.text = [@(myInfo[7]) stringValue];
                    if (myInfo[1]>0)
                        self.dineroLabel.textColor = [UIColor blackColor];
                }
                break;
        }
    }
    
}

-(void)sendMyMessage{
    NSString *data = [self encodeStringToSend];
    NSData *dataToSend = [data dataUsingEncoding:NSUTF8StringEncoding];
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
    
    if([[receivedText componentsSeparatedByString:@"/"] count] > 1) {
        [self decodeStringReceived:receivedText];
    }
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end