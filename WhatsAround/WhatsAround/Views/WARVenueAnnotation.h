//
//  WARVenueAnnotation.h
//  WhatsAround
//
//  Created by Thomas Blitz on 04/06/13.
//  Copyright (c) 2013 PenguinSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "FSQVenue.h"
@interface WARVenueAnnotation : NSObject <MKAnnotation>

- (id)initWithVenue:(FSQVenue *)venue;
@end
