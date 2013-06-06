//
//  GisterPost.h
//  GisterPost
//
//  Created by Thomas Blitz on 06/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "LoginProtocol.h"

@interface GisterPost : NSObject <LoginProtocol>
@property (nonatomic, strong) NSString *selectedText;

@property (nonatomic, strong) UserCredential *userCredential;
@end