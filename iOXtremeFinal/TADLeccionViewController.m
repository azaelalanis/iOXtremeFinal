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
 (C) PIXABAY pixabay.com
 */

#import "TADLeccionViewController.h"

@interface TADLeccionViewController ()

@end

@implementation TADLeccionViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}

-(void)setTemas:(Tema *)agua Energias:(Tema *)energias Biodiversidad:(Tema *)biodiversidad Reciclaje:(Tema *)reciclaje
{
    _agua = agua;
    _energias = energias;
    _biodiversidad = biodiversidad;
    _reciclaje = reciclaje;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        self.pageImages = (self.detailItem).pageImages;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create the data model
    
    
   // _pageImages = @[@"biodiversidadcopy.png", @"agua2.png", @"agua3.png", @"agua4.png"];
    
    _pageImages = (self.detailItem).pageImages;
    _songTitles = (self.detailItem).pageSongs;

    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    TADPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    [((TADPageContentViewController*)[self.pageViewController.viewControllers objectAtIndex:0]) audioPlay];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TADPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TADPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (TADPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageImages count] == 0) || (index >= [self.pageImages count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    TADPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.songTitle = self.songTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageImages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)startWalkthrough:(id)sender {
    TADPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    [((TADPageContentViewController*)[self.pageViewController.viewControllers objectAtIndex:0]) audioPlay];

}

#pragma mark Delgate
-(void) pageViewController:(UIPageViewController*) pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (finished) {
        [((TADPageContentViewController*)[pageViewController.viewControllers objectAtIndex:0]) audioPlay];
    }
}

-(void) pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    [((TADPageContentViewController*)[pageViewController.viewControllers objectAtIndex:0]) audioStop];
}


@end
