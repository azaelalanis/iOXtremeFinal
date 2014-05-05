//
//  Tema.m
//  iOXtremeFinal
//
//  Created by Tania Garrido Salido on 3/28/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "Tema.h"

@implementation Tema

-(id) initWithName: (NSString *) fondo elMenu: (NSString *) menu laActividad:(NSString *)actividad elNombre:(NSString *)nombre elVideo:(NSString *)video elLink:(NSString *)link elTutorial:(NSArray *)tutorial lasCanciones:(NSArray *)canciones
{
    self = [super init];
    
    if  (self){
        _fondo = fondo;
        _menu = menu;
        _nombre = nombre;
        _actividad = actividad;
        _video = video;
        _link = link;
        _pageImages = tutorial;
        _pageSongs = canciones;
    }
    
    return self;
}

@end
