//
//  TADPageContentViewController.h
//  iOXtremeFinal
//
//  Created by Tania Garrido Salido on 5/4/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TADPageContentViewController : UIViewController
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@property NSString *songTitle;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
-(void)audioPlay;
-(void)audioStop;

@end
