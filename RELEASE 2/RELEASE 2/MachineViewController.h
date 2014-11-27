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

//imagenes
@property (strong, nonatomic) IBOutlet UIImageView *circuloImageView;
@property (strong, nonatomic) IBOutlet UIImageView *cuadradoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *trianguloImageView;
@property (strong, nonatomic) IBOutlet UIButton *powerImageView;

//agregar materiales
- (IBAction)agregarCirculo:(id)sender;
- (IBAction)agregarCuadrado:(id)sender;
- (IBAction)agregarTriangulo:(id)sender;

@end
