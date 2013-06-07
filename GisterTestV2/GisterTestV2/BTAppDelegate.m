//
//  BTAppDelegate.m
//  GisterTestV2
//
//  Created by Thomas Blitz on 07/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import "BTAppDelegate.h"
#import "BTGitHubEngine.h"

@implementation BTAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    BTGitHubEngine *engine = [[BTGitHubEngine alloc]initWithUsername:@"mvagusta.ago@gmail.com" password:@"Master1109" withReachability:NO];
    [engine retain];
    
    NSString *gist = [NSString stringWithFormat:@"This is a test gist"];

    [engine gistsForUser:@"logikBlitz" success:^(id gists) {
        NSLog(@"%@", gists);
    } failure:^(NSError *error) {
        NSLog(@"error: %@", error);
    }];
    
    NSDictionary *content = @{@"content": gist};
    NSDictionary *filename = @{@"gistFilename.txt": content};
    //NSDictionary *files = @{@"files":filename};
    
    NSDictionary *gistDict = @{@"description": @"THis is a gist description",
                               @"public": @NO,
                               @"files":filename
                               };
    
    [engine createGist:gistDict success:^(id success) {
        //NSLog(@" Success %@", success);
    } failure:^(NSError *error) {
        NSLog(@"ERROR: %@", error);
    }];
    
//    string retValue = "{"
//    + "\"description\": \""+description+"\","
//    + "\"public\": "+isPublic.ToString().ToLower()+","
//    + "\"files\": {"
//    + "\""+filename+"\": {"
//    + "\"content\": \""+realContent+"\""
//    + "}}}";
//    return retValue;
    
    [engine release];
}

- (void)createGist:(NSString *)filename description:(NSString *)description isPublic:(BOOL)isPublic gistText:(NSString *)gist{
    NSDictionary *contentDict = @{@"content": gist};
    NSDictionary *filenameDict = @{filename: contentDict};
    //NSDictionary *files = @{@"files":filename};
    NSNumber *isPublicNumber = [NSNumber numberWithBool:isPublic];
    NSDictionary *gistDict = @{@"description": description,
                               @"public": isPublicNumber,
                               @"files":filenameDict
                               };

}

@end
