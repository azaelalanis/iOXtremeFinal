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
 
 
 SONG COPYRIGHT:
 (C)2009/2011 JPFruitCo
 (C)2009/2011 John Patrick McKenna
 
 IMAGES COPYRIGHT:
 (C) PEPSI CO. Aprendizaje Verde Web Page
 */

#import "TADViewController.h"
#import "TADOpcionesViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TADViewController (){
    AVAudioPlayer *audioPlayer;
    bool presionado;
}

@end

@implementation TADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self cargarObjetos];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Childrens" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    audioPlayer.numberOfLoops = -1;
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    presionado = TRUE;
}

-(void) cargarObjetos
{
    _agua = [[Tema alloc] initWithName:@"fondoAgua.png" elMenu:@"menuAgua.png" laActividad:@"actividadAguaTransparente.png" elNombre:@"agua" elVideo:@"agua_video.png" elLink:@"https://www.youtube.com/watch?v=XFOx9QnMcEg" elTutorial:@[@"agua1.png", @"agua2.png", @"agua3.png", @"agua4.png"] lasCanciones:@[@"Agua1", @"Agua2", @"Agua3", @"Agua4"]];
    _energias = [[Tema alloc] initWithName:@"fondoRenovables.png" elMenu:@"menuRenovables.png" laActividad:@"actividadEnergiasTransparente.png" elNombre:@"energias" elVideo:@"energias_video.png" elLink:@"https://www.youtube.com/watch?v=ER8ompQN5QM" elTutorial:@[@"energias1.png", @"energias2.png", @"energias3.png", @"energias4.png", @"energias5.png", @"energias6.png"] lasCanciones:@[@"Energias1", @"Energias2", @"Energias3", @"Energias4", @"Energias5", @"Energias6"]];
    _reciclaje = [[Tema alloc] initWithName:@"fondoReciclaje.png" elMenu:@"menuReciclaje.png" laActividad:@"actividadReciclajeTransparente.png" elNombre:@"reciclaje" elVideo:@"reciclaje_video.png" elLink:@"https://www.youtube.com/watch?v=ea_WRUux0Zg" elTutorial:@[@"reciclaje1.png", @"reciclaje2.png", @"reciclaje3.png", @"reciclaje4.png"] lasCanciones:@[@"Reciclaje1", @"Reciclaje2", @"Reciclaje3", @"Reciclaje4"]];
    _biodiversidad = [[Tema alloc] initWithName:@"fondoBiodiversidad.png" elMenu:@"menuBiodiversidad.png" laActividad:@"actividadBiodiversidadTransparente.png" elNombre:@"biodiversidad" elVideo:@"biodiversidad_video.png" elLink:@"https://www.youtube.com/watch?v=VULFyIr2tj8" elTutorial:@[@"biodiversidad1.png", @"biodiversidad2.png", @"biodiversidad3.png"] lasCanciones:@[@"Biodiversidad1", @"Biodiversidad2", @"Biodiversidad3"]];
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

- (IBAction)botonPlayStop:(id)sender {
    presionado = !presionado;
    if (presionado) {
        [audioPlayer play];
    } else {
        [audioPlayer stop];
    }
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
    [audioPlayer stop];

    if (![[segue identifier] isEqualToString:@"sobreNosotros"]) {
        [[segue destinationViewController] setDetailItem:_paraEnviar];
        [[segue destinationViewController] setTemas:_agua Energias:_energias Biodiversidad:_biodiversidad Reciclaje:_reciclaje];
    }
    
}
@end
