//
//  MachineViewController.h
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "ViewController.h"

@interface MachineViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *minutosTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *numeroMaquinaLabel;
@property (strong, nonatomic) IBOutlet UILabel *entradaCirculoLabel;
@property (strong, nonatomic) IBOutlet UILabel *entradaCuadradoLabel;
@property (strong, nonatomic) IBOutlet UILabel *entradaTrianguloLabel;
@property (strong, nonatomic) IBOutlet UILabel *dineroLabel;
@property (strong, nonatomic) IBOutlet UILabel *minutosAjusteLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosAjusteLabel;
@property (strong, nonatomic) IBOutlet UILabel *minutosCirculoLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosCirculoLabel;
@property (strong, nonatomic) IBOutlet UILabel *minutosCuadradoLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosCuadradoLabel;
@property (strong, nonatomic) IBOutlet UILabel *minutosTrianguloLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosTrianguloLabel;
@property (strong, nonatomic) IBOutlet UILabel *estadoLabel;
@property (weak, nonatomic) IBOutlet UIButton *circle;
@property (weak, nonatomic) IBOutlet UIButton *square;
@property (weak, nonatomic) IBOutlet UIButton *triangle;


//imagenes botones
- (IBAction)selectCirculoButton:(id)sender;
- (IBAction)selectCuadradoButton:(id)sender;
- (IBAction)selectTrianguloLabel:(id)sender;
- (IBAction)changePowerButton:(id)sender;

-(void)setMachineNumber:(int)num;


//agregar materiales
- (IBAction)agregarCirculo:(id)sender;
- (IBAction)agregarCuadrado:(id)sender;
- (IBAction)agregarTriangulo:(id)sender;

@end
