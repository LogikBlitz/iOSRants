//
//  WARVenueAnnotation.m
//  WhatsAround
//
//  Created by Thomas Blitz on 04/06/13.
//  Copyright (c) 2013 PenguinSoft. All rights reserved.
//

#import "WARVenueAnnotation.h"

@interface WARVenueAnnotation ()
@property (nonatomic, strong) FSQVenue *venue;
@end

@implementation WARVenueAnnotation

- (id)initWithVenue:(FSQVenue *)venue
{
    self = [super init];
    if (self) {
        _venue = venue;
    }
    return self;
}



- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.venue.latitude floatValue], [self.venue.longitude floatValue]);
}

- (NSString *)title {
    return self.venue.name;
}
@end
