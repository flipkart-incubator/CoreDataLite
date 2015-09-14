//
//  CoreDataException.h
//  Pods
//
//  Created by Prabodh Prakash on 21/08/15.
//
//

#import <Foundation/Foundation.h>

/*!
 This is a subclass of NSException and is used to raise all kinds of CoreDataException
 */
@interface CoreDataException : NSException

/*!
 @param reason String containing reson for crash
 
 @return The newly-initialized CoreDataException
 */
- (instancetype) initWithReason: (NSString*) reason;

@end
