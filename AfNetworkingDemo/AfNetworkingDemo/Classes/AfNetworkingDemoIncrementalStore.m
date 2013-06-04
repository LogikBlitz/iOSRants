#import "AfNetworkingDemoIncrementalStore.h"
#import "AfNetworkingDemoAPIClient.h"

@implementation AfNetworkingDemoIncrementalStore

+ (void)initialize {
    [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self type]];
}

+ (NSString *)type {
    return NSStringFromClass(self);
}

+ (NSManagedObjectModel *)model {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"AfNetworkingDemo" withExtension:@"xcdatamodeld"]];
}

- (id <AFIncrementalStoreHTTPClient>)HTTPClient {
    return [AfNetworkingDemoAPIClient sharedClient];
}

@end