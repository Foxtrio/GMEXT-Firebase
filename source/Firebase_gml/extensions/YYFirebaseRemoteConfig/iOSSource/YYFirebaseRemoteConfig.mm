#import "YYFirebaseRemoteConfig.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char *_key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char *_key, double _value);
extern "C" void dsMapAddString(int _dsMap, char *_key, char *_value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

@interface YYFirebaseRemoteConfig ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data;
- (NSString *)convertObjectToJsonString:(id)obj;

@end

@implementation YYFirebaseRemoteConfig

- (id)init
{
    if (self = [super init]) {
        if (![FIRApp defaultApp]) {
            [FIRApp configure];
        }
    }
    return self;
}

#pragma mark - Firebase Remote Config Methods

- (void)FirebaseRemoteConfig_Initialize:(double)seconds
{
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] init];
    remoteConfigSettings.minimumFetchInterval = seconds;
    [FIRRemoteConfig remoteConfig].configSettings = remoteConfigSettings;
    NSLog(@"FirebaseRemoteConfig initialized with fetch interval: %f seconds", seconds);
}

- (void)FirebaseRemoteConfig_FetchAndActivate
{
    __weak YYFirebaseRemoteConfig *weakSelf = self;
    [[FIRRemoteConfig remoteConfig] fetchAndActivateWithCompletionHandler:^(FIRRemoteConfigFetchAndActivateStatus status, NSError *_Nullable error) {
        __strong YYFirebaseRemoteConfig *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@"FirebaseRemoteConfig_FetchAndActivate" forKey:@"type"];

        if (status == FIRRemoteConfigFetchAndActivateStatusSuccessFetchedFromRemote || status == FIRRemoteConfigFetchAndActivateStatusSuccessUsingPreFetchedData) {
            [data setObject:@(1.0) forKey:@"success"];
            NSLog(@"Fetch and activate succeeded");
        } else {
            [data setObject:@(0.0) forKey:@"success"];
            if (error) {
                NSString *errorMessage = [error localizedDescription];
                [data setObject:errorMessage forKey:@"error"];
                NSLog(@"Fetch and activate failed: %@", errorMessage);
            } else {
                NSLog(@"Fetch and activate failed with unknown error");
            }
        }

        [strongSelf sendAsyncEventWithType:@"FirebaseRemoteConfig_FetchAndActivate" data:data];
    }];
}

- (void)FirebaseRemoteConfig_Reset
{
    NSLog(@"FirebaseRemoteConfig_Reset: This function is not supported on iOS");
    // Optionally, send an event back indicating that reset is not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@"FirebaseRemoteConfig_Reset" forKey:@"type"];
    [data setObject:@(0.0) forKey:@"success"];
    [data setObject:@"Reset is not supported on iOS" forKey:@"error"];
    [self sendAsyncEventWithType:@"FirebaseRemoteConfig_Reset" data:data];
}

- (void)FirebaseRemoteConfig_SetDefaultsAsync:(NSString *)json
{
    // Offload JSON parsing to a background thread
    __weak YYFirebaseRemoteConfig *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong YYFirebaseRemoteConfig *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSError *jsonError = nil;
        NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonMap = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@"FirebaseRemoteConfig_SetDefaultsAsync" forKey:@"type"];

        if (jsonError) {
            [data setObject:@(0.0) forKey:@"success"];
            [data setObject:[jsonError localizedDescription] forKey:@"error"];
            NSLog(@"SetDefaultsAsync failed: %@", [jsonError localizedDescription]);
        } else {
            [[FIRRemoteConfig remoteConfig] setDefaults:jsonMap];
            [data setObject:@(1.0) forKey:@"success"];
            NSLog(@"SetDefaultsAsync succeeded");
        }

        [strongSelf sendAsyncEventWithType:@"FirebaseRemoteConfig_SetDefaultsAsync" data:data];
    });
}

- (NSString *)FirebaseRemoteConfig_GetKeys
{
    NSArray<NSString *> *remoteKeys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceRemote];
    NSArray<NSString *> *defaultKeys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceDefault];

    NSMutableSet<NSString *> *keySet = [NSMutableSet setWithArray:remoteKeys];
    [keySet addObjectsFromArray:defaultKeys];

    NSArray<NSString *> *allKeys = [keySet allObjects];

    NSString *keysJson = [self convertObjectToJsonString:allKeys];
    NSLog(@"FirebaseRemoteConfig_GetKeys: %@", keysJson);

    return keysJson;
}

- (NSString *)FirebaseRemoteConfig_GetString:(NSString *)key
{
    NSString *value = [[[FIRRemoteConfig remoteConfig] configValueForKey:key] stringValue];
    NSLog(@"FirebaseRemoteConfig_GetString: Key=%@, Value=%@", key, value);
    return value;
}

- (double)FirebaseRemoteConfig_GetDouble:(NSString *)key
{
    double value = [[[[FIRRemoteConfig remoteConfig] configValueForKey:key] numberValue] doubleValue];
    NSLog(@"FirebaseRemoteConfig_GetDouble: Key=%@, Value=%f", key, value);
    return value;
}

- (void)FirebaseRemoteConfig_AddOnConfigUpdateListener
{
    __weak YYFirebaseRemoteConfig *weakSelf = self;
    [[FIRRemoteConfig remoteConfig] addOnConfigUpdateListener:^(FIRRemoteConfigUpdate *_Nonnull configUpdate, NSError *_Nullable error) {
        __strong YYFirebaseRemoteConfig *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@"FirebaseRemoteConfig_AddOnConfigUpdateListener" forKey:@"type"];

        if (error != nil) {
            [data setObject:@(0.0) forKey:@"success"];
            [data setObject:[error localizedDescription] forKey:@"error"];
            NSLog(@"ConfigUpdateListener onError: %@", [error localizedDescription]);
        } else {
            [data setObject:@(1.0) forKey:@"success"];

            NSArray<NSString *> *updatedKeys = [configUpdate.updatedKeys allObjects];
            NSString *keysString = [strongSelf convertObjectToJsonString:updatedKeys];
            [data setObject:keysString forKey:@"keys"];

            NSLog(@"ConfigUpdateListener onUpdate: Keys=%@", keysString);
        }

        [strongSelf sendAsyncEventWithType:@"FirebaseRemoteConfig_AddOnConfigUpdateListener" data:data];
    }];
}

#pragma mark - Helper Methods

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data {
    dispatch_async(dispatch_get_main_queue(), ^{
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, (char *)"type", (char *)[eventType UTF8String]);

        for (NSString *key in data) {
            id value = data[key];
            const char *cKey = [key UTF8String];

            if ([value isKindOfClass:[NSString class]]) {
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[value UTF8String]);
            } else if ([value isKindOfClass:[NSNumber class]]) {
                NSNumber *numberValue = (NSNumber *)value;
                const char *type = [numberValue objCType];

                // Handle BOOL
                if (strcmp(type, @encode(BOOL)) == 0 || strcmp(type, @encode(bool)) == 0 || strcmp(type, @encode(char)) == 0) {
                    int boolValue = [numberValue boolValue] ? 1 : 0;
                    dsMapAddInt(dsMapIndex, (char *)cKey, boolValue);
                }
                // Handle integer types within int range
                else if (strcmp(type, @encode(int)) == 0 ||
                         strcmp(type, @encode(short)) == 0 ||
                         strcmp(type, @encode(unsigned int)) == 0 ||
                         strcmp(type, @encode(unsigned short)) == 0) {

                    int intValue = [numberValue intValue];
                    dsMapAddInt(dsMapIndex, (char *)cKey, intValue);
                }
                // Handle floating-point numbers
                else if (strcmp(type, @encode(float)) == 0 ||
                         strcmp(type, @encode(double)) == 0) {

                    double doubleValue = [numberValue doubleValue];
                    dsMapAddDouble(dsMapIndex, (char *)cKey, doubleValue);
                }
                // Handle larger integer types
                else if (strcmp(type, @encode(long)) == 0 ||
                         strcmp(type, @encode(long long)) == 0 ||
                         strcmp(type, @encode(unsigned long)) == 0 ||
                         strcmp(type, @encode(unsigned long long)) == 0) {

                    // Check if the value fits into an int
                    long long longValue = [numberValue longLongValue];
                    if (longValue >= INT_MIN && longValue <= INT_MAX) {
                        dsMapAddInt(dsMapIndex, (char *)cKey, (int)longValue);
                    } else {
                        // Represent as string to avoid overflow
                        NSString *stringValue = [numberValue stringValue];
                        dsMapAddString(dsMapIndex, (char *)cKey, (char *)[stringValue UTF8String]);
                    }
                } else {
                    // For other numeric types, default to adding as double
                    double doubleValue = [numberValue doubleValue];
                    dsMapAddDouble(dsMapIndex, (char *)cKey, doubleValue);
                }
            } else {
                // For other types, convert to string
                NSString *stringValue = [value description];
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[stringValue UTF8String]);
            }
        }

        createSocialAsyncEventWithDSMap(dsMapIndex);
    });
}

- (NSString *)convertObjectToJsonString:(id)obj
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    if (error == nil) {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    } else {
        NSLog(@"Error converting object to JSON: %@", [error localizedDescription]);
        return @"[]";
    }
}

@end
