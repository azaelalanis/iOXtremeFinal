/*
 Calentamiento Global para Niños - Consta de Una aplicación móvil para iPad que contiene información sobre el calentamiento
 global específicamente sobre el cuidado del agua, la biodiversidad, las energías renovables y el reciclaje.
 Esta aplicación va a estar enfocada en niños de preescolar y el material contenido será fácilmente
 utilizado por niños de esta edad. Se utilizará la información contenida en la página web de Aprendizaje
 Verde para Preescolar que existe actualmente y en caso de ser necesario se modificará la presentación
 de ésta para que pueda ser manipulada por los niños.
 
 Copyright (C) 2014 - ITESM
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 
 Authors:
 
 ITESM representatives
 Ing. Martha Sordia Salinas <msordia@itesm.mx>
 Dr. Juan Arturo Nolazco Flores <jnolazco@itesm.mx>
 Ing. Maria Isabel Cabrera Cancino <marisa.cabrera@tecvirtual.mx>
 
 
 ITESM students
 Tania Garrido Salido <taniagarridosalido@gmail.com>
 Azael Alanis Garza <azaelalanis.g@gmail.com>
 David de la Fuente Amaya <jdfa14@gmail.com>
 
 
 IMAGES COPYRIGHT:
 (C) PEPSI CO. Aprendizaje Verde Web Page
 */

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
    self.imagenMenu.image = [UIImage imageNamed:(self.detailItem).menu];
    _nombre = (self.detailItem).nombre;
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
    NSLog(@"Actividad Colorear");
}

- (IBAction)unwindOpciones:(UIStoryboardSegue*) segue {
}

//Prepara los datos para mandarlos a la siguiente vista:
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"biodiversidad"]){
        _paraEnviar = _biodiversidad;
    }else if ([[segue identifier] isEqualToString:@"home"]){
        NSLog(@"hola");
    }else if ([[segue identifier] isEqualToString:@"agua"]){
        _paraEnviar = _agua;
    } else if ([[segue identifier] isEqualToString:@"renovables"]){
        _paraEnviar = _energias;
    } else if ([[segue identifier] isEqualToString:@"reciclaje"]){
        _paraEnviar = _reciclaje;
    } else if ([[segue identifier] isEqualToString:@"colorear"]){
        if ([_nombre isEqualToString:@"agua"]) {
            _paraEnviar = _agua;
        } else if ([_nombre isEqualToString:@"biodiversidad"]){
            _paraEnviar = _biodiversidad;
        } else if ([_nombre isEqualToString:@"reciclaje"]){
            _paraEnviar = _reciclaje;
        } else if ([_nombre isEqualToString:@"energias"]){
            _paraEnviar = _energias;
        }
    }else if ([[segue identifier] isEqualToString:@"video"]){
        if ([_nombre isEqualToString:@"agua"]) {
            _paraEnviar = _agua;
        } else if ([_nombre isEqualToString:@"biodiversidad"]){
            _paraEnviar = _biodiversidad;
        } else if ([_nombre isEqualToString:@"reciclaje"]){
            _paraEnviar = _reciclaje;
        } else if ([_nombre isEqualToString:@"energias"]){
            _paraEnviar = _energias;
        }
    }else if ([[segue identifier] isEqualToString:@"leccion"]){
        if ([_nombre isEqualToString:@"agua"]) {
            _paraEnviar = _agua;
        } else if ([_nombre isEqualToString:@"biodiversidad"]){
            _paraEnviar = _biodiversidad;
        } else if ([_nombre isEqualToString:@"reciclaje"]){
            _paraEnviar = _reciclaje;
        } else if ([_nombre isEqualToString:@"energias"]){
            _paraEnviar = _energias;
        }
    }
    if (_paraEnviar != NULL) {
        [[segue destinationViewController] setDetailItem:_paraEnviar];
        [[segue destinationViewController] setTemas:_agua Energias:_energias Biodiversidad:_biodiversidad Reciclaje:_reciclaje];
    }
    _paraEnviar = NULL;
}
@end
