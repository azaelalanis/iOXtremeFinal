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

#import <UIKit/UIKit.h>
#import "Tema.h"

@interface TADOpcionesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagenFondo;
@property (weak, nonatomic) IBOutlet UIImageView *imagenMenu;
@property (strong, nonatomic) Tema* detailItem;

@property (strong,nonatomic) Tema *agua;
@property (strong,nonatomic) Tema *energias;
@property (strong,nonatomic) Tema *reciclaje;
@property (strong,nonatomic) Tema *biodiversidad;
@property (strong,nonatomic) Tema *paraEnviar;
@property (weak, nonatomic) IBOutlet UIButton *BAgua;
@property (strong,nonatomic) NSString *nombre;


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
