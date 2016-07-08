//
//  CoreDataManager.h
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import <Foundation/Foundation.h>
#import "CoreDatabaseInterface.h"

/*!
 This is a singleton class that can be used to initialize CoreDatabaseInterface. 
 */
@interface CoreDataManager : NSObject

/**
 @param key String value key against which a MOC will be identified
 @param storeURL NSURL value at which store is present
 @param objectModel location of momd file against the storeURL
 @return CoreDatabaseInterface the coredatabase interface mapped against the key
 */
- (CoreDatabaseInterface*) setupCoreDataWithKey:(NSString*) mocIdentifier
                                       storeURL: (NSURL*) storeURL
                          objectModelIdentifier:( NSString*) objectModelIdentifier;

/**
 @param key String value key against which a MOC will be identified
 @param storeURL NSURL value at which store is present
 @param objectModel location of momd file against the storeURL
 @param options     options to be used for setup. For more info refer 'Store Options' and 'Migration Options' at
                    https://developer.apple.com/library/ios/documentation/Cocoa/Reference/CoreDataFramework/Classes/NSPersistentStoreCoordinator_Class/index.html#//apple_ref/doc/constant_group/Migration_Options
 @return CoreDatabaseInterface the coredatabase interface mapped against the key
 */
- (CoreDatabaseInterface*) setupCoreDataWithKey:(NSString*) mocIdentifier
                                       storeURL: (NSURL*) storeURL
                          objectModelIdentifier:( NSString*) objectModelIdentifier
                                        options:(NSDictionary *)options;

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
