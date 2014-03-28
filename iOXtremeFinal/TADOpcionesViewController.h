//
//  TADOpcionesViewController.h
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tema.h"

@interface TADOpcionesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagenFondo;
@property (strong, nonatomic) Tema* detailItem;

@property (strong,nonatomic) Tema *agua;
@property (strong,nonatomic) Tema *energias;
@property (strong,nonatomic) Tema *reciclaje;
@property (strong,nonatomic) Tema *biodiversidad;
@property (strong,nonatomic) Tema *paraEnviar;

- (IBAction)botonHome:(id)sender;
- (IBAction)botonAgua:(id)sender;
- (IBAction)botonReciclaje:(id)sender;
- (IBAction)botonEnergiasReno:(id)sender;
- (IBAction)botonBiodiversidad:(id)sender;
- (IBAction)botonLeccion:(id)sender;
- (IBAction)botonCuentos:(id)sender;
- (IBAction)botonActividadColores:(id)sender;

-(void)setTemas:(Tema *)agua Energias:(Tema *)energias Biodiversidad:(Tema *)biodiversidad Reciclaje:(Tema *)reciclaje;
@end
