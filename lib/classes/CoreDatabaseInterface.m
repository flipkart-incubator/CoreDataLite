//
//  CoreDatabaseInterface.m
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import "CoreDatabaseInterface.h"
#import <CoreDataException.h>

@class CoreDatabaseInterface;
@interface CoreDatabaseInterface()

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext_MQ;
@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext_PQ;
@property (nonatomic, strong) NSPersistentStoreCoordinator* defaultPersistentStoreCoordinator;
@property (nonatomic, strong) NSPersistentStoreCoordinator* privatePersistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel* managedObjectModel;

@property (nonatomic, strong) NSURL* storeURL;
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSURL* applicationDocumentDirectory;

@property (nonatomic, strong) NSURL* storeOptions;

@end

@interface CoreDatabaseInterface()
{
    dispatch_queue_t serialQueue;
}

@end

@implementation CoreDatabaseInterface

- (instancetype) initWithStoreURL:(NSURL *)storeURL
            objectModelIdentifier:(NSString *)objectModelIdentifier
                          options:(NSDictionary *)options
{
    self = [super init];
    
    if (self)
    {
        _storeURL = storeURL;
        _identifier = objectModelIdentifier;
        _storeOptions = options;
        
        const char* key = [[NSString stringWithFormat:@"%@", storeURL] UTF8String];
        
        serialQueue = dispatch_queue_create(key, DISPATCH_QUEUE_SERIAL);
        
        [self managedObjectModel];
        [self privatePersistentStoreCoordinator];
        [self defaultPersistentStoreCoordinator];
        [self managedObjectContext_PQ];
    }
    
    return self;
}

- (NSManagedObjectContext*) getPrivateQueueManagedObjectContext
{
    return [self managedObjectContext_PQ];
}

- (NSPersistentStoreCoordinator*) getMainPersistentStoreCoordinator
{
    return [self defaultPersistentStoreCoordinator];
}

- (NSPersistentStoreCoordinator*) getPrivateQueuePersistentStoreCoordinator
{
    return [self privatePersistentStoreCoordinator];
}

- (NSManagedObjectContext*) managedObjectContext_PQ
{
    if (!_managedObjectContext_PQ)
    {
        _managedObjectContext_PQ = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        
        [_managedObjectContext_PQ setPersistentStoreCoordinator:_privatePersistentStoreCoordinator];
    }
    
    return _managedObjectContext_PQ;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSPersistentStoreCoordinator*) createPersistentStoreCoordinatorWithOptions:(NSDictionary *)options
{
    NSError *error = nil;
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:_storeURL
                                                        options:options
                                                          error:&error])
    {
        NSString* exceptionReason = [NSString stringWithFormat:@"Error initilizing persistent store coordinator for storeURL %@", _storeURL];
        @throw [[CoreDataException alloc] initWithReason:exceptionReason];
    }
    
    return persistentStoreCoordinator;
}


- (NSPersistentStoreCoordinator*) defaultPersistentStoreCoordinator
{
    if (_defaultPersistentStoreCoordinator != nil)
    {
        return _defaultPersistentStoreCoordinator;
    }
    
    _defaultPersistentStoreCoordinator = [self createPersistentStoreCoordinatorWithOptions:self.storeOptions];
    
    return _defaultPersistentStoreCoordinator;
}

- (NSPersistentStoreCoordinator*) privatePersistentStoreCoordinator
{
    if (_privatePersistentStoreCoordinator != nil)
    {
        return _privatePersistentStoreCoordinator;
    }
    
    NSError *error = nil;
    _privatePersistentStoreCoordinator = [self createPersistentStoreCoordinatorWithOptions:self.storeOptions];
    
    return _privatePersistentStoreCoordinator;
}

- (NSManagedObjectModel*) managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:_identifier withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (dispatch_queue_t) getSerialQueue
{
    return serialQueue;
}

- (dispatch_queue_t) getConcurrentQueue
{
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

@end
