//
//  CoreDataException.h
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import <Foundation/Foundation.h>

@interface CoreDataException : NSException

/**
 @param reason String containing reson for crash
 
 @return The newly-initialized CoreDataException
 */
- (instancetype) initWithReason: (NSString*) reason;

@end
