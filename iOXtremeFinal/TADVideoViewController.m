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
 
 VIDEO COPYRIGHT:
 (C) PEPSI CO. Aprendizaje Verde Web Page
 */
#import "TADVideoViewController.h"

@interface TADVideoViewController ()

@end

@implementation TADVideoViewController
@synthesize videoImage;


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
        
        self.videoImage.image = [UIImage imageNamed:(self.detailItem).video];
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
    // Do any additional setup after loading the view.
    self.videoImage.image = [UIImage imageNamed:(self.detailItem).video];
    _paraEnviar = NULL;
    [self embedYouTube:[self getYTUrlStr:(self.detailItem).link] frame:self.youTube.frame];
    
    
}

- (NSString*)getYTUrlStr:(NSString*)url
{
    if (url == nil)
        return nil;
    
    NSString *retVal = [url stringByReplacingOccurrencesOfString:@"watch?v=" withString:@"v/"];
    
    NSRange pos=[retVal rangeOfString:@"version"];
    if(pos.location == NSNotFound)
    {
        retVal = [retVal stringByAppendingString:@"?version=3&hl=en_EN"];
    }
    return retVal;
}



- (void)embedYouTube:(NSString*)url frame:(CGRect)frame {
    
    NSString* embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: transparent;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    NSString* html = [NSString stringWithFormat:embedHTML, url, frame.size.width * 2 + 165, frame.size.height * 2+ 165];
    
    UIWebView *viewVideo = [[UIWebView alloc] initWithFrame:frame];
    [viewVideo loadHTMLString:html baseURL:nil];
    viewVideo.scalesPageToFit = YES;
    viewVideo.mediaPlaybackAllowsAirPlay = YES;
    viewVideo.allowsInlineMediaPlayback = YES;
    [self.view addSubview:viewVideo];
    
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

@end
