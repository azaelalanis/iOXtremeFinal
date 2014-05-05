//
//  TADViewController.m
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

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
    _agua = [[Tema alloc] initWithName:@"fondoAgua.png" elMenu:@"menuAgua.png" laActividad:@"actividadAguaTransparente.png" elNombre:@"agua" elVideo:@"agua_video.png" elLink:@"https://www.youtube.com/watch?v=XFOx9QnMcEg" elTutorial:@[@"agua1.png", @"agua2.png", @"agua3.png", @"agua4.png"] lasCanciones:@[]];
    _energias = [[Tema alloc] initWithName:@"fondoRenovables.png" elMenu:@"menuRenovables.png" laActividad:@"actividadEnergiasTransparente.png" elNombre:@"energias" elVideo:@"energias_video.png" elLink:@"https://www.youtube.com/watch?v=ER8ompQN5QM" elTutorial:@[@"energias1.png", @"energias2.png", @"energias3.png", @"energias4.png", @"energias5.png", @"energias6.png"] lasCanciones:@[]];
    _reciclaje = [[Tema alloc] initWithName:@"fondoReciclaje.png" elMenu:@"menuReciclaje.png" laActividad:@"actividadReciclajeTransparente.png" elNombre:@"reciclaje" elVideo:@"reciclaje_video.png" elLink:@"https://www.youtube.com/watch?v=ea_WRUux0Zg" elTutorial:@[@"reciclaje1.png", @"reciclaje2.png", @"reciclaje3.png", @"reciclaje4.png"] lasCanciones:@[@"Reciclaje1", @"Reciclaje2", @"Reciclaje3", @"Reciclaje4"]];
    _biodiversidad = [[Tema alloc] initWithName:@"fondoBiodiversidad.png" elMenu:@"menuBiodiversidad.png" laActividad:@"actividadBiodiversidadTransparente.png" elNombre:@"biodiversidad" elVideo:@"biodiversidad_video.png" elLink:@"https://www.youtube.com/watch?v=VULFyIr2tj8" elTutorial:@[@"biodiversidad1.png", @"biodiversidad2.png", @"biodiversidad3.png"] lasCanciones:@[]];
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
