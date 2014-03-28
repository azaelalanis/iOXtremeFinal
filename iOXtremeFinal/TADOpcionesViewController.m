//
//  TADOpcionesViewController.m
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "TADOpcionesViewController.h"

@interface TADOpcionesViewController ()

@end

@implementation TADOpcionesViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}

-(void)setTemas:(Tema *)agua Energias:(Tema *)energias Biodiversidad:(Tema *)biodiversidad Reciclaje:(Tema *)reciclaje
{
    _agua = agua;
    _energias = energias;
    _biodiversidad = biodiversidad;
    _reciclaje = reciclaje;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        self.imagenFondo.image = [UIImage imageNamed:(self.detailItem).fondo];


    }
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
    // Do any additional setup after loading the view.
    self.imagenFondo.image = [UIImage imageNamed:(self.detailItem).fondo];
    _paraEnviar = NULL;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)botonHome:(id)sender {
}

- (IBAction)botonAgua:(id)sender {
}

- (IBAction)botonReciclaje:(id)sender {
}

- (IBAction)botonEnergiasReno:(id)sender {
}

- (IBAction)botonBiodiversidad:(id)sender {
}

- (IBAction)botonLeccion:(id)sender {
}

- (IBAction)botonCuentos:(id)sender {
}

- (IBAction)botonActividadColores:(id)sender {
}

- (IBAction)unwindOpciones:(UIStoryboardSegue*) segue {
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
    if (_paraEnviar != NULL) {
        [[segue destinationViewController] setDetailItem:_paraEnviar];
        [[segue destinationViewController] setTemas:_agua Energias:_energias Biodiversidad:_biodiversidad Reciclaje:_reciclaje];
    }

}
@end
