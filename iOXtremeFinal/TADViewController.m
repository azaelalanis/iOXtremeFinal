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
    _agua = [[Tema alloc] initWithName:@"aprendizajeAgua.png"];
    _energias = [[Tema alloc] initWithName:@"aprendizajeEnergias.png"];
    _reciclaje = [[Tema alloc] initWithName:@"aprendizajeReciclaje.png"];
    _biodiversidad = [[Tema alloc] initWithName:@"aprendizajeBiodiversidad.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonBiodiversidad:(id)sender {
    NSLog(@"Biodiversidad");
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
    } else if ([[segue identifier] isEqualToString:@"energias"]){
        _paraEnviar = _energias;
    } else if ([[segue identifier] isEqualToString:@"reciclaje"]){
        _paraEnviar = _reciclaje;
    }
    [[segue destinationViewController] setDetailItem:_paraEnviar];
    [[segue destinationViewController] setTemas:_agua Energias:_energias Biodiversidad:_biodiversidad Reciclaje:_reciclaje];
}
@end
