//
//  TADViewController.h
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tema.h"
#import "TADOpcionesViewController.h"
#import "TADSobreNosotrosViewController.h"

@interface TADViewController : UIViewController
@property (strong,nonatomic) Tema *agua;
@property (strong,nonatomic) Tema *energias;
@property (strong,nonatomic) Tema *reciclaje;
@property (strong,nonatomic) Tema *biodiversidad;
@property (strong,nonatomic) Tema *paraEnviar;
@property (strong, nonatomic) Tema* detailItem;


- (IBAction)botonCuidaAgua:(id)sender;
- (IBAction)botonEnergiaRenovable:(id)sender;
- (IBAction)botonReciclaje:(id)sender;
- (IBAction)botonBiodiversidad:(id)sender;
- (IBAction)botonSobreNosotros:(id)sender;
- (IBAction)botonPlayStop:(id)sender;


@end
