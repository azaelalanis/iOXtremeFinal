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
 
 */

#import "TADAppDelegate.h"

@implementation TADAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"aplicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"aplicationWillEnterForeground");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
