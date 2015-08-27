//
//  CoreDataManager.h
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import <Foundation/Foundation.h>
#import "CoreDatabaseInterface.h"

@interface CoreDataManager : NSObject

/**
 @param key String value key against which a MOC will be identified
 @param storeURL NSURL value at which store is present
 @param objectModel location of momd file against the storeURL
 */
- (void) setupCoreDataWithKey:(NSString*) key storeURL: (NSURL*) storeURL objectModel:(NSString*) objectModel;

/**
 @param key String value key against which a MOC will be identified
 
 @return already initialized CoreDatabaseInterface
 */
- (CoreDatabaseInterface*) getCoreDataInterfaceForKey: (NSString*) key;

/**
 @return singleton instance of CoreDataManager
 */
+ (id)sharedManager;

@end
