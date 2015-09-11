//
//  CoreDatabaseInterface.h
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDatabaseInterface : NSObject

/**
 @param storeURL instance of NSURL at which store is present
 @param objectModel location of momd file against the store URL. This param does not expect "momd" as extension
 
 @retun the newly initialized CoreDatabaseInterface object
 */
- (instancetype) initWithStoreKey: (NSString*) storeKey objectModelIdentifier: (NSString*) objectModelIdentifier;

/**
 @return MOC working at main thread
 */
- (NSManagedObjectContext*) getMainManagedObjectContext;

/**
 @return MOC working on private thread
 */
- (NSManagedObjectContext*) getPrivateQueueManagedObjectContext;

/**
 @return Persistent Store Coordinator associated with main managedObjectContext
 */
- (NSPersistentStoreCoordinator*) getMainPersistentStoreCoordinator;

/**
 @return Persistent Store Coordinator associated with private queue ManagedObjectContext
 */
- (NSPersistentStoreCoordinator*) getPrivateQueuePersistentStoreCoordinator;

/**
 @return serial dispatch_queue_t
 */
- (dispatch_queue_t) getSerialQueue;

/**
 @return concurrent dispatch_queue_t
 */
- (dispatch_queue_t) getConcurrentQueue;

@end
