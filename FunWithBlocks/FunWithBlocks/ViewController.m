//
//  ViewController.m
//  FunWithBlocks
//
//  Created by Thomas Blitz on 03/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import "ViewController.h"

typedef void (^ImageCompletionBlock)(UIImage *);
typedef void (^ActionBlock)();

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.wallpapers = @[@"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-01.jpg",
                        @"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-02.jpg",
                        @"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-03.jpg",
                        @"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-04.jpg",
                        @"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-05.jpg",
                        @"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-06.jpg",
                        @"http://www.fantasywallpapers.in/bulkupload/Fantasy/Erotic/Erotic%20Fantasy-07.jpg"
                        ];
    
    UITapGestureRecognizer *tabRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(loadWallpaper)];
    
    [self.view addGestureRecognizer:tabRecognizer];
    
    self.lastWallpaperIndex = 0;
    
    _wallpaperView = [[UIImageView alloc] initWithImage:nil];
    _wallpaperView.frame = self.view.bounds;
    _wallpaperView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_wallpaperView];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	self.indicator.hidesWhenStopped = YES;
    self.indicator.center = self.view.center;
    [self.view addSubview:self.indicator];
    
    [self loadWallpaper];
}

- (void)fetchImageWithURL:(NSURL *)url completion:(ImageCompletionBlock)completion{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        NSLog(@"Image size: %@", NSStringFromCGSize(image.size));
        [self resizeImage:image toWidth:self.view.frame.size.width completionBlock:completion];
        });

}

-(void)resizeImage:(UIImage *)image toWidth:(CGFloat)width completionBlock:(ImageCompletionBlock)completionBlock{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage *thumbImage = nil;
        CGSize newSize = CGSizeMake(width, (width/image.size.width) * image.size.height);
        
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        thumbImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        completionBlock(thumbImage);
    });
    
}
- (void)scaleImageTo:(CGFloat)scale completion:(ActionBlock)completion{
    CGFloat duration = 0.3f;
    [UIView animateWithDuration:duration animations:^{
        self.wallpaperView.transform = CGAffineTransformMakeScale(scale, scale);
    }completion:^(BOOL finished) {
        if (completion) completion();
    }];
}

- (void)bounceImage{
    [self scaleImageTo:1.1 completion:^{
        [self scaleImageTo:0.9 completion:^{
            [self scaleImageTo:1.0 completion:nil];
        }];
    }];
    
}

-(void)loadWallpaper {
    [self.indicator startAnimating];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.wallpaperView.alpha = 0;
    }];
    
    NSURL *url = [NSURL URLWithString:self.wallpapers[self.lastWallpaperIndex]];
    self.lastWallpaperIndex += 1;
    if (self.lastWallpaperIndex >= [self.wallpapers count]) self.lastWallpaperIndex = 0;
    
    [self fetchImageWithURL:url completion:^(UIImage *image){
        dispatch_async(dispatch_get_main_queue(), ^{
            self.wallpaperView.image = image;
            [self.indicator stopAnimating];
            [UIView animateWithDuration:0.5 animations:^{
                self.wallpaperView.alpha = 1;
            }];
            
            [self bounceImage];
        });
    }]; 
}

- (BOOL)shouldAutorotate{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
