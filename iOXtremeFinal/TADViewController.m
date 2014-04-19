//
//  TADViewController.m
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "TADViewController.h"
#import "TADOpcionesViewController.h"

@interface TADViewController ()

@end

@implementation TADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self cargarObjetos];
    //self.imageDollar.image = [UIImage imageNamed:@".."];
}

-(void) cargarObjetos
{
    _agua = [[Tema alloc] initWithName:@"fondoAgua.png" elMenu:@"menuAgua.png" laActividad:@"actividadAgua.png" elNombre:@"agua"];
    _energias = [[Tema alloc] initWithName:@"fondoRenovables.png" elMenu:@"menuRenovables.png" laActividad:@"actividadEnergias.png" elNombre:@"energias"];
    _reciclaje = [[Tema alloc] initWithName:@"fondoReciclaje.png" elMenu:@"menuReciclaje.png" laActividad:@"actividadReciclaje.png" elNombre:@"reciclaje"];
    _biodiversidad = [[Tema alloc] initWithName:@"fondoBiodiversidad.png" elMenu:@"menuBiodiversidad.png" laActividad:@"actividadBiodiversidad.png" elNombre:@"biodiversidad"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonBiodiversidad:(id)sender {
    NSLog(@"Biodiversidad");
}

- (IBAction)botonSobreNosotros:(id)sender {
    
}

- (IBAction)botonCuidaAgua:(id)sender {
    NSLog(@"Cuidar Agua");
}

- (IBAction)botonEnergiaRenovable:(id)sender {
    NSLog(@"Energia Renovable");

}

- (IBAction)botonReciclaje:(id)sender {
    NSLog(@"Reciclaje");
}

- (IBAction)unwindHome:(UIStoryboardSegue*) segue {
}

//Prepara los datos para mandarlos a la siguiente vista:
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"biodiversidad"]){
        _paraEnviar = _biodiversidad;
    } else if ([[segue identifier] isEqualToString:@"agua"]){
        _paraEnviar = _agua;
    } else if ([[segue identifier] isEqualToString:@"renovables"]){
        _paraEnviar = _energias;
    } else if ([[segue identifier] isEqualToString:@"reciclaje"]){
        _paraEnviar = _reciclaje;
    } else if ([[segue identifier] isEqualToString:@"sobreNosotros"]){
        
    }
    
    if (![[segue identifier] isEqualToString:@"sobreNosotros"]) {
        [[segue destinationViewController] setDetailItem:_paraEnviar];
        [[segue destinationViewController] setTemas:_agua Energias:_energias Biodiversidad:_biodiversidad Reciclaje:_reciclaje];
    }
    
}
@end
