//
//  TADVideoViewController.h
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tema.h"

@interface TADVideoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *youTube;

@property (strong, nonatomic) Tema* detailItem;

@property (strong,nonatomic) Tema *agua;
@property (strong,nonatomic) Tema *energias;
@property (strong,nonatomic) Tema *reciclaje;
@property (strong,nonatomic) Tema *biodiversidad;
@property (strong,nonatomic) Tema *paraEnviar;

@property (weak, nonatomic) IBOutlet UIImageView *videoImage;
-(void)setTemas:(Tema *)agua Energias:(Tema *)energias Biodiversidad:(Tema *)biodiversidad Reciclaje:(Tema *)reciclaje;
@end
