//
//  TADColoresViewController.m
//  iOXtremeFinal
//
//  Created by Azael Alanis on 3/25/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "TADColoresViewController.h"

@interface TADColoresViewController ()

@end

@implementation TADColoresViewController
@synthesize mainImage;
@synthesize tempImage;
@synthesize prueba;

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
        
        self.mainImage.image = [UIImage imageNamed:(self.detailItem).actividad];
        self.tempImage.image = [UIImage imageNamed:(self.detailItem).actividad];       
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
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 10.0;
    opacity = 1.0;
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.mainImage.image = [UIImage imageNamed:(self.detailItem).actividad];
    self.tempImage.image = [UIImage imageNamed:(self.detailItem).actividad];
    self.prueba.image = [UIImage imageNamed:(self.detailItem).actividad];
    _paraEnviar = NULL;
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

- (IBAction)colorPressed:(id)sender {
    
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
        case 0:
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 1:
            red = 121.0/255.0;
            green = 121.0/255.0;
            blue = 107.0/255.0;
            break;
        case 2:
            red = 255.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 3:
            red = 232.0/255.0;
            green = 216.0/255.0;
            blue = 125.0/255.0;
            break;
        case 4:
            red = 241.0/255.0;
            green = 224.0/255.0;
            blue = 8.0/255.0;
            break;
        case 5:
            red = 235.0/255.0;
            green = 125.0/255.0;
            blue = 7.0/255.0;
            break;
        case 6:
            red = 128.0/255.0;
            green = 77.0/255.0;
            blue = 20.0/255.0;
            break;
        case 7:
            red = 219.0/255.0;
            green = 40.0/255.0;
            blue = 16.0/255.0;
            break;
        case 8:
            red = 223.0/255.0;
            green = 21.0/255.0;
            blue = 139.0/255.0;
            break;
        case 9:
            red = 138.0/255.0;
            green = 28.0/255.0;
            blue = 238.0/255.0;
            break;
        case 10:
            red = 25.0/255.0;
            green = 40.0/255.0;
            blue = 233.0/255.0;
            break;
        case 11:
            red = 10.0/255.0;
            green = 166.0/255.0;
            blue = 221.0/255.0;
            break;
        case 12:
            red = 67.0/255.0;
            green = 124.0/255.0;
            blue = 7.0/255.0;
            break;
        case 13:
            red = 89.0/255.0;
            green = 217.0/255.0;
            blue = 13.0/255.0;
            break;
    }

}

- (IBAction)whitePressed:(id)sender {
    red = 255.0/255.0;
    green = 255.0/255.0;
    blue = 255.0/255.0;
    opacity = 1.0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.tempImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempImage setAlpha:1.0];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.bounds.size);
        [self.tempImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.mainImage.bounds.size.width, self.mainImage.bounds.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempImage.image drawInRect:CGRectMake(0, 0, self.mainImage.bounds.size.width, self.mainImage.bounds.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempImage.image = nil;
    UIGraphicsEndImageContext();
}

- (IBAction)save:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Save to Camera Roll", @"Cancel", nil];
    [actionSheet showInView:self.view];
    
}

+ (UIImage*)mergeImage:(UIImage*)first withImage:(UIImage*)second
{
    // get size of the first image
    CGImageRef firstImageRef = first.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    
    // get size of the second image
    CGImageRef secondImageRef = second.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    
    // build merged size
    CGSize mergedSize = CGSizeMake(MIN(firstWidth, secondWidth), MIN(firstHeight, secondHeight));
    
    // capture image context ref
    UIGraphicsBeginImageContext(mergedSize);
    
    //Draw images onto the context
    [first drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [second drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    
    // assign context to new UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end context
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0) {
        
        //self.guardar = [[UIImage alloc] init];
        
        mainImage.image = [TADColoresViewController mergeImage:mainImage.image withImage:prueba.image];
        
        
        UIGraphicsBeginImageContextWithOptions(self.mainImage.bounds.size, NO, 0.0);
        [self.mainImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height)];
        UIImage *SaveImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(SaveImage, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
        
       // UIImageWriteToSavedPhotosAlbum(_guardar, nil, nil, nil);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Image could not be saved.Please try again"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image was successfully saved in photoalbum"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    }
}

@end
