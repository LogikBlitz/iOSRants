//
//  ViewController.h
//  FunWithBlocks
//
//  Created by Thomas Blitz on 03/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIImageView *wallpaperView;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) NSArray *wallpapers;
@property (nonatomic) NSInteger lastWallpaperIndex;

@end
