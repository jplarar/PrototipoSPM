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
    int numMachine;
    int myInfo[11];
    int onAdjustTime[7];
    int onProdCircle[7];
    int onProdSquare[7];
    int onProdTriangle[7];
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
    
    
}
@end

@implementation MachineViewController

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
    // Do any additional setup after loading the view.
    
    
    // inicia contador
    segundos = 0;
    minutos = 0;
    
    //inicializador de state
    myInfo[0] = 1;
    //inicializador de power
    myInfo[4] = 2;
    
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
    

    for (int x=0; x < (sizeof myInfo/sizeof(int)); x++)
    {
        if(x == numMachine)
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
    if (myInfo[0] == 1) {
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
    
    for (int x=0; x < (sizeof myInfo/sizeof(int)); x++)
        myInfo[x] = [myReceivedInfo[x] intValue];
    
    
}
-(NSString *)encodeStringReceived
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

-(void)setMachineNumber:(int)num
{
    numMachine = num;
    NSString *strNum = [@(num) stringValue];
    self.numeroMaquinaLabel.text = strNum;
}
-(void)update
{
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

self.dineroLabel.text = [@(myInfo[1]) stringValue];
self.entradaCirculoLabel.text = [@(myInfo[5]) stringValue];
self.entradaCuadradoLabel.text = [@(myInfo[6]) stringValue];
self.entradaTrianguloLabel.text = [@(myInfo[7]) stringValue];


}
- (IBAction)agregarCirculo:(id)sender
{
    if (myInfo[0] == 1){
    myInfo[5]++;
    self.entradaCirculoLabel.text = [@(myInfo[5]) stringValue];
    }

}
- (IBAction)agregarCuadrado:(id)sender
{
    if (myInfo[0] == 1){
    myInfo[6]++;
    self.entradaCuadradoLabel.text = [@(myInfo[6]) stringValue];
    }

}
- (IBAction)agregarTriangulo:(id)sender
{
    if (myInfo[0] == 1){
    myInfo[7]++;
    self.entradaTrianguloLabel.text = [@(myInfo[7]) stringValue];
    }
}


- (IBAction)selectCirculoButton:(id)sender
{
    if (myInfo[0] == 1 && myInfo[4] != 3){
        myInfo[5]=1;
        //Actualizar imagen de material seleccionado
        [sender setImage:[UIImage imageNamed:@"circleGreen.png"] forState:UIControlStateNormal];
        [self.square setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
        [self.triangle setImage:[UIImage imageNamed:@"triangle.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)selectCuadradoButton:(id)sender
{
    if (myInfo[0] == 1 && myInfo[4] != 3){
        myInfo[5]=2;
        //Actualizar imagen de material seleccionado
        [sender setImage:[UIImage imageNamed:@"squareGreen.png"] forState:UIControlStateNormal];
        [self.circle setImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        [self.triangle setImage:[UIImage imageNamed:@"triangle.png"] forState:UIControlStateNormal];
    }

}
- (IBAction)selectTrianguloLabel:(id)sender
{
    if (myInfo[0] == 1 && myInfo[4] != 3){
        myInfo[5]=3;
        //Actualizar imagen de material seleccionado
        [sender setImage:[UIImage imageNamed:@"triangleGreen.png"] forState:UIControlStateNormal];
        [self.circle setImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        [self.square setImage:[UIImage imageNamed:@"square.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)changePowerButton:(id)sender
{
    if (myInfo[0] == 1){
    
        if (myInfo[4]==1)
        {
            myInfo[4]=2;
            //Actualizar imagen de estado seleccionado
            [sender setImage:[UIImage imageNamed:@"powerRed.png"] forState:UIControlStateNormal];
        }
        else if (myInfo[4]==2)
        {
            myInfo[4]=1;
            //Actualizar imagen de estado seleccionado
            [sender setImage:[UIImage imageNamed:@"powerGreen.png"] forState:UIControlStateNormal];

        }
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