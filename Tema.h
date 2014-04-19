//
//  Tema.h
//  iOXtremeFinal
//
//  Created by Tania Garrido Salido on 3/28/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tema : NSObject

@property (weak,nonatomic) NSString* fondo;
@property (weak,nonatomic) NSString* menu;
@property (weak,nonatomic) NSString* actividad;
@property (weak,nonatomic) NSString* nombre;


-(id) initWithName: (NSString *) fondo elMenu: (NSString *) menu laActividad: (NSString *) actividad elNombre:(NSString *) nombre;

@end
