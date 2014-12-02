//
//  MasterViewController.h
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MasterViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina1;
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina2;
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina3;
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina4;
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina5;
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina6;
@property (strong, nonatomic) IBOutlet UIImageView *estadoMaquina7;

@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina1;
@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina2;
@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina3;
@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina4;
@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina5;
@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina6;
@property (strong, nonatomic) IBOutlet UIImageView *materialMaquina7;

- (IBAction)stopAll:(id)sender;

- (IBAction)verDetalle1:(id)sender;
- (IBAction)verDetalle2:(id)sender;
- (IBAction)verDetalle3:(id)sender;
- (IBAction)verDetalle4:(id)sender;
- (IBAction)verDetalle5:(id)sender;
- (IBAction)verDetalle6:(id)sender;
- (IBAction)verDetalle7:(id)sender;


@end
