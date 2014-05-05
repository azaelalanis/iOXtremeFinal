//
//  TADVideoViewController.m
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

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
