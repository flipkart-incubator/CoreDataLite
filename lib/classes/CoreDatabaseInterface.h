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

- (id) initWithStoreName: (NSURL*) storeURL objectModel: (NSString*) objectModel;
- (NSManagedObjectContext*) getMainManagedObjectContext;
- (NSManagedObjectContext*) getPrivateQueueManagedObjectContext;
- (NSPersistentStoreCoordinator*) getMainPersistentStoreCoordinator;
- (NSPersistentStoreCoordinator*) getPrivateQueuePersistentStoreCoordinator;

@end
