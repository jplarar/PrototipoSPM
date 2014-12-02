//
//  DetailViewController.h
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *minutosTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *numeroMaquinaLabel;
@property (strong, nonatomic) IBOutlet UILabel *dineroLabel;
@property (strong, nonatomic) IBOutlet UIButton *estadoMaquina;
@property (strong, nonatomic) IBOutlet UILabel *estadoMaquinaLabel;

@property (strong, nonatomic) IBOutlet UILabel *minutosAjusteLabel;
@property (strong, nonatomic) IBOutlet UILabel *segundosAjusteLabel;
@property int numMachine;

@property (strong, nonatomic) IBOutlet UIImageView *ciruclo;
@property (strong, nonatomic) IBOutlet UIImageView *cuadrado;
@property (strong, nonatomic) IBOutlet UIImageView *triangulo;

@property (strong,nonatomic) id datos;

@end
