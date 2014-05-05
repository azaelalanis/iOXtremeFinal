//
//  TADLeccionViewController.h
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TADPageContentViewController.h"
#import "Tema.h"

@interface TADLeccionViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray *songTitles;
@property (strong, nonatomic) Tema* detailItem;
@property (strong,nonatomic) Tema *agua;
@property (strong,nonatomic) Tema *energias;
@property (strong,nonatomic) Tema *reciclaje;
@property (strong,nonatomic) Tema *biodiversidad;
@property (strong,nonatomic) Tema *paraEnviar;

-(void)setTemas:(Tema *)agua Energias:(Tema *)energias Biodiversidad:(Tema *)biodiversidad Reciclaje:(Tema *)reciclaje;
@end

