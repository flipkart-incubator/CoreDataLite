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

- (void) setupCoreDataWithKey:(NSString*) key storeName: (NSString*) storeName objectModel:(NSString*) objectModel;
- (CoreDatabaseInterface*) getCoreDataInterfaceForKey: (NSString*) key;

+ (id)sharedManager;

@end
