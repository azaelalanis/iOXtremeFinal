//
//  Tema.m
//  iOXtremeFinal
//
//  Created by Tania Garrido Salido on 3/28/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "Tema.h"

@implementation Tema

-(id) initWithName: (NSString *) fondo elMenu: (NSString *) menu
{
    self = [super init];
    
    if  (self){
        _fondo = fondo;
        _menu = menu;
    }
    
    return self;
}

@end
