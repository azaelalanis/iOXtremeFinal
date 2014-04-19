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


-(id) initWithName: (NSString *) fondo elMenu: (NSString *) menu;

@end
