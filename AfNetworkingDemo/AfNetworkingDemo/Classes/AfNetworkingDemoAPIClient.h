#import "AFIncrementalStore.h"
#import "AFRestClient.h"

@interface AfNetworkingDemoAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (AfNetworkingDemoAPIClient *)sharedClient;

@end
