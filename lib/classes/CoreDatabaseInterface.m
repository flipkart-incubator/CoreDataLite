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
@property (nonatomic, strong) NSString* momdFile;
@property (nonatomic, strong) NSURL* applicationDocumentDirectory;

@end

@implementation CoreDatabaseInterface

- (id) initWithStoreName: (NSURL*) storeURL objectModel: (NSString*) objectModel
{
    self = [super init];
    
    if (self)
    {
        _storeURL = storeURL;
        _momdFile = objectModel;
    }
    
    return self;
}

- (NSManagedObjectContext*) getMainManagedObjectContext
{
    return [self managedObjectContext_MQ];
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

- (NSManagedObjectContext*) managedObjectContext_MQ
{
    if (!_managedObjectContext_MQ)
    {
        _managedObjectContext_MQ = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
         [_managedObjectContext_MQ setPersistentStoreCoordinator:_defaultPersistentStoreCoordinator];
    }
    
    return _managedObjectContext_MQ;
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

- (NSPersistentStoreCoordinator*) defaultPersistentStoreCoordinator
{
    if (_defaultPersistentStoreCoordinator != nil)
    {
        return _defaultPersistentStoreCoordinator;
    }
    
    NSError *error = nil;
    if (![_defaultPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                          configuration:nil
                                                                    URL:_storeURL
                                                                options:nil error:&error])
    {
        NSString* exceptionReason = [NSString stringWithFormat:@"Error initilizing persistent store coordinator for storeURL %@", _storeURL];
        @throw [[CoreDataException alloc] initWithReason:exceptionReason];
    }
    
    return _defaultPersistentStoreCoordinator;
}

- (NSPersistentStoreCoordinator*) privatePersistentStoreCoordinator
{
    if (_privatePersistentStoreCoordinator != nil)
    {
        return _privatePersistentStoreCoordinator;
    }
    
    NSError *error = nil;
    if (![_privatePersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                          configuration:nil
                                                                    URL:_storeURL
                                                                options:nil error:&error])
    {
        NSString* exceptionReason = [NSString stringWithFormat:@"Error initilizing persistent store coordinator for storeURL %@", _storeURL];
        @throw [[CoreDataException alloc] initWithReason:exceptionReason];
    }
    
    return _privatePersistentStoreCoordinator;
}

- (NSManagedObjectModel*) managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:_momdFile withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

@end
