//
//  DetailViewController.h
//  CoreDataBasics
//
//  Created by Thomas Blitz on 03/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
