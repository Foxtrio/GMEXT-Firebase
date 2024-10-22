// FirebaseUtils.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirebaseUtils : NSObject

+ (instancetype)sharedInstance;

// Async ID Generation
- (long)getNextAsyncId;

// Task Submission
- (void)submitAsyncTask:(void (^)(void))task;
- (void)submitAsyncTask:(void (^)(void))task completion:(nullable void (^)(NSError * _Nullable error))completion;

// JSON Conversion
+ (id)convertJSON:(id)json;
+ (NSDictionary<NSString *, id> *)convertNSDictionary:(NSDictionary<NSString *, id> *)dict;
+ (NSArray<id> *)convertNSArray:(NSArray<id> *)array;
+ (NSNumber *)convertStringToLongIfApplicable:(NSString *)str;

// Sending Asynchronous Events
+ (void)sendSocialAsyncEvent:(NSString *)eventType data:(NSDictionary *)data;
+ (void)sendAsyncEvent:(int)eventId eventType:(NSString *)eventType data:(NSDictionary *)data;

// Extension Options
+ (double)extOptionGetReal:(NSString *)extension option:(NSString *)option;
+ (int)extOptionGetInt:(NSString *)extension option:(NSString *)option;
+ (NSString *)extOptionGetString:(NSString *)extension option:(NSString *)option;
+ (BOOL)extOptionGetBool:(NSString *)extension option:(NSString *)option;

// Shutdown
- (void)shutdown;

@end

NS_ASSUME_NONNULL_END