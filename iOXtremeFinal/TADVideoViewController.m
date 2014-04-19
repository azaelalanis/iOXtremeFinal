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
    
    [self embedYouTube:[self getYTUrlStr:@"https://www.youtube.com/watch?v=VULFyIr2tj8"] frame:CGRectMake(0,40,self.view.frame.size.width, self.view.frame.size.height-40)];

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
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    NSString* html = [NSString stringWithFormat:embedHTML, url, frame.size.width, frame.size.height];
    if(_youTube == nil) {
        _youTube = [[UIWebView alloc] initWithFrame:frame];
        _youTube.delegate = self;
        [self.view addSubview:_youTube];
    }
    
    
    _youTube.mediaPlaybackAllowsAirPlay=YES;
    _youTube.allowsInlineMediaPlayback=YES;
    [_youTube loadHTMLString:html baseURL:nil];
    
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
